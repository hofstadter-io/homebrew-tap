class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.1/hof_0.1.1_MacOS-64bit.tar.gz"
  version "0.1.1"
  sha256 "d39dcea68af4682970775073d0120f02b2a123af56b1773e20064a1139fdd252"

  def install
    bin.install "hof"
  end
end
