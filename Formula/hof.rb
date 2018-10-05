class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.3/hof_0.1.3_MacOS-64bit.tar.gz"
  version "0.1.3"
  sha256 "5dd3a3f9d0b350c35d69fd482b8cc11911316c68c9795c7cc8caf61705257dbf"

  def install
    bin.install "hof"
  end
end
