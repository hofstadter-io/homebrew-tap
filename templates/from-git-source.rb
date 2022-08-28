class {{ title .name }} < Formula
  desc "{{ .desc }}"
  homepage "{{ .homepage }}"
  version "{{ .version }}"
  url "{{ .url }}",
    tag:      "{{ .tag }}",
    revision: "{{ .commit }}"
  license "{{ .license }}"
  head "{{ .url }}", branch: "{{ .branch }}"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "da7fa63d18da0c17f4bd2b4d1ddef8a1fa6bf9409ad32646db184e2da74a4472"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "da7fa63d18da0c17f4bd2b4d1ddef8a1fa6bf9409ad32646db184e2da74a4472"
    sha256 cellar: :any_skip_relocation, monterey:       "0b9a77f9209c943caabd4cbb896a8cd31690d474735998df1a30ce777b7cee19"
    sha256 cellar: :any_skip_relocation, big_sur:        "0b9a77f9209c943caabd4cbb896a8cd31690d474735998df1a30ce777b7cee19"
    sha256 cellar: :any_skip_relocation, catalina:       "0b9a77f9209c943caabd4cbb896a8cd31690d474735998df1a30ce777b7cee19"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7386d7a1f88d925e4621e1950e1edbca8361d813f68084eee7d53d185ad0da49"
  end

  depends_on "go" => :build
  depends_on "docker" => :test

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    ldflags = %W[ {{ .ldflags }} ]

    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(ldflags: ldflags), "./{{ .cmddir }}"

    bash_output = Utils.safe_popen_read(bin/"hof", "completion", "bash")
    (bash_completion/"hof").write bash_output
    zsh_output = Utils.safe_popen_read(bin/"hof", "completion", "zsh")
    (zsh_completion/"_hof").write zsh_output
    fish_output = Utils.safe_popen_read(bin/"hof", "completion", "fish")
    (fish_completion/"hof.fish").write fish_output
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/hof version")

    system bin/"hof", "mod", "init", "cue", "brew.sh/brewtest"
    assert_predicate testpath/"cue.mods", :exist?
    assert_equal "module: \"brew.sh/brewtest\"", (testpath/"cue.mod/module.cue").read.chomp

    assert_match version.to_s, shell_output(bin/"hof version")
  end
end
