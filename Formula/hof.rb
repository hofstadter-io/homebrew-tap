class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.0/hof_0.1.0_MacOS-64bit.tar.gz"
  version "0.1.0"
  sha256 "25e2f96a14a86000556050cbbeeb6e5c09e8e755d4cdda90dd88fb9c4e6cf06a"

  def install
    bin.install "hof"
  end
end
