class Squirrel < Formula
  desc "squirrel downloads URLs to a SQLite database."
  homepage "https://schollz.com/software/squirrel/"
  url "https://github.com/schollz/squirrel/releases/download/v1.0.4/squirrel_1.0.4_macOS-64bit.tar.gz"
  version "1.0.4"
  sha256 "711110228283c4cad0edbe90f9000ce8fa126c689d9139de55cf76b967cb8506"

  def install
    bin.install "squirrel"
  end

  test do
    system "#{bin}/squirrel --version"
  end
end
