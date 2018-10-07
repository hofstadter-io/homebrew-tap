class Hof < Formula
  desc "Hofstadter Studios CLI"
  homepage "https://github.com/hofstadter-io/hof"
  url "https://github.com/hofstadter-io/hof/releases/download/0.1.6/hof_0.1.6_MacOS-64bit.tar.gz"
  version "0.1.6"
  sha256 "c140cda89240ae98dfcafc26f12897d968b7a95296073b5f0335b36e1800882a"

  def install
    bin.install "hof"
  end
end
