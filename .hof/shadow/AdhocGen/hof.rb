class Hof < Formula
  desc "Flexible data modeling & code generation system"
  homepage "https://hofstadter.io/"
  version "0.6.7-rc.2"
  url "https://github.com/hofstadter-io/hof.git",
    tag:      "v0.6.7-rc.2",
    revision: "521e084f36adf29a9e71636a05f02904c481ef89"
  license "BSD-3-Clause"
  head "https://github.com/hofstadter-io/hof.git", branch: "_dev"

  depends_on "go" => :build
  depends_on "docker" => :test

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    ldflags = %W[ -s -w -X github.com/hofstadter-io/hof/cmd/hof/verinfo.Version=#{version} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.Commit=#{Utils.git_head} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.BuildDate=#{time.iso8601} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.GoVersion=#{Formula["go"].version} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.BuildOS=#{os} -X github.com/hofstadter-io/hof/cmd/hof/verinfo.BuildArch=#{arch} ]

    ENV["CGO_ENABLED"] = "0"
    ENV["HOF_TELEMETRY_DISABLED"] = 1
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/hof"

    generate_completions_from_executable(bin/"hof", "completion")
  end

  test do
    ENV["HOF_TELEMETRY_DISABLED"] = 1
    assert_match "v#{version}", shell_output("#{bin}/hof version")
  end
end
