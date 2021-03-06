class Multirepo < Formula
  desc "An easy to use tool to clone and manage multiple git repositories at once."
  homepage "https://github.com/semdangelo/multirepo"
  url "https://github.com/semdangelo/multirepo.git",
    :tag => "v1.2"
  version "1.2"

  bottle :unneeded

  def install
    bin.install "multirepo"
  end
end
