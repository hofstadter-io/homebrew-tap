class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.5/hof_0.1.5_MacOS-64bit.tar.gz"
  version "0.1.5"
  sha256 "da5d15d18ed2ad17e8989b3678ad6cf6371e510b0735a0a97be02264f4145ab5"

  def install
    bin.install "hof"
  end
end
