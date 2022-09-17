class {{ title .name }} < Formula
  desc "{{ .desc }}"
  homepage "{{ .homepage }}"
  url "{{ .url }}",
    tag:      "{{ .tag }}",
    revision: "{{ .commit }}"
  license "{{ .license }}"
  head "{{ .url }}", branch: "{{ .branch }}"

  depends_on "go" => :build
  depends_on "docker" => :test

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    ldflags = %W[ {{ .ldflags }} ]

    ENV["CGO_ENABLED"] = "0"
    ENV["{{ upper .name }}_TELEMETRY_DISABLED"] = 1
    system "go", "build", *std_go_args(ldflags: ldflags), "./{{ .cmddir }}"

    bash_output = Utils.safe_popen_read(bin/"{{ .name }}", "completion", "bash")
    (bash_completion/"{{ .name }}").write bash_output
    zsh_output = Utils.safe_popen_read(bin/"{{ .name }}", "completion", "zsh")
    (zsh_completion/"_{{ .name }}").write zsh_output
    fish_output = Utils.safe_popen_read(bin/"{{ .name }}", "completion", "fish")
    (fish_completion/"{{ .name }}.fish").write fish_output
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/{{ .name }} version")
  end
end

