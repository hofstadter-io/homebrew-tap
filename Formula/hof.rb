class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.2/hof_0.1.2_MacOS-64bit.tar.gz"
  version "0.1.2"
  sha256 "7cbd5fc383325f47748173c2b86f900d5cd93b1fb6cd55e67dc14b3230e701e4"

  def install
    bin.install "hof"
  end
end
