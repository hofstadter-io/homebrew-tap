class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.4/hof_0.1.4_MacOS-64bit.tar.gz"
  version "0.1.4"
  sha256 "f847a3fce09ebe0ca3c0c4f230b81f566fa35af8859fe3ca2c60b7b04be799bf"

  def install
    bin.install "hof"
  end
end
