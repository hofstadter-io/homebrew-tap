class {{ title .name }} < Formula
  desc "{{ .desc }}"
  homepage "{{ .homepage }}"
  version "{{ .version }}"
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

    generate_completions_from_executable(bin/"{{ .name }}", "completion")
  end

  test do
    ENV["{{ upper .name }}_TELEMETRY_DISABLED"] = 1
    assert_match "v#{version}", shell_output("#{bin}/{{ .name }} version")
  end
end
