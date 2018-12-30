class Geb < Formula
  desc "designs + {{templates}} = anything"
  homepage "https://geb.hofstadter.io"
  url "https://github.com/hofstadter-io/geb/releases/download/0.10.2/geb_0.10.2_MacOS-64bit.tar.gz"
  version "0.10.2"
  sha256 "21505047d417dac9d0ca811bd3f415e2f14b89c54ff16a83bd4bad59187415df"

  def install
    bin.install "geb"
  end
end
