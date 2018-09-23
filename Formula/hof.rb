class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://docs.hofstadter.io"
  url "https://github.com/hofstadter-io/hof/releases/download/0.0.1/hof_0.0.1_MacOS-64bit.tar.gz"
  version "0.0.1"
  sha256 "b918497ca7519d66901f6cdec9b7b830244f7897b38be941c790b29a4d30cbb1"

  def install
    bin.install "hof"
  end
end
