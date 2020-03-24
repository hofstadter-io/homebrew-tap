class Mvs < Formula
  desc "MVS is a polyglot dependency management tool based on go mods"
  homepage "https://github.com/hofstadter-io/mvs"
  url "https://github.com/hofstadter-io/mvs/releases/download/0.0.1/mvs_0.0.1_MacOS-64bit.tar.gz"
  version "0.0.1"
  sha256 "21505047d417dac9d0ca811bd3f415e2f14b89c54ff16a83bd4bad59187415df"

  def install
    bin.install "geb"
  end
end
