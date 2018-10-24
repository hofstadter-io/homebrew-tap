class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.8/hof_0.1.8_MacOS-64bit.tar.gz"
  version "0.1.8"
  sha256 "41ae68134e1f0823fc6deaa820054b8b360226c921f54d9ecb9e10cb9b3d6fdb"

  def install
    bin.install "hof"
  end
end
