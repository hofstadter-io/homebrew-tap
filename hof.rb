class Hof < Formula
  desc "A flexible data modeling & code generation system"
  homepage "https://hofstadter.io/"
  version "v0.6.8-beta.11"
  url "https://github.com/hofstadter-io/hof.git",
    tag:      "v0.6.8-beta.11",
    revision: "3f3eef40bde51b1a27763f9638bbabaa897ae52c"
  license "BSD-3-Clause"
  head "https://github.com/hofstadter-io/hof.git", branch: "_dev"

  depends_on "go" => :build
  depends_on "docker" => :test

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    ldflags = %W[ -s -w -X github.com/hofstadter-io/hof/cmd/hof/verinfo.Version=#{version} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.Commit=#{Utils.git_head} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.BuildDate=#{time.iso8601} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.GoVersion=#{Formula["go"].version} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.BuildOS=#{os} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.BuildArch=#{arch} ]

    ENV["CGO_ENABLED"] = "0"
    ENV["HOF_TELEMETRY_DISABLED"] = "1"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/hof"

    generate_completions_from_executable(bin/"hof", "completion")
  end

  test do
    ENV["HOF_TELEMETRY_DISABLED"] = "1"
    assert_match "v#{version}", shell_output("#{bin}/hof version")

    system bin/"hof", "mod", "init", "cue", "brew.sh/brewtest"
    assert_equal "module: \"brew.sh/brewtest\"", (testpath/"cue.mod/module.cue").read.chomp

    assert_match version.to_s, shell_output(bin/"hof version")
  end
end
