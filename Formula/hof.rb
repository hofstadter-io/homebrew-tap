class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.7/hof_0.1.7_MacOS-64bit.tar.gz"
  version "0.1.7"
  sha256 "29653aa8c5d762561d01dfcf8b0756cd50943e35d7632ca7c9c840225a56c05f"

  def install
    bin.install "hof"
  end
end
