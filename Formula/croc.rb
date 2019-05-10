class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  url "https://github.com/schollz/croc/releases/download/v6.0.3/croc_6.0.3_macOS-64bit.tar.gz"
  version "6.0.3"
  sha256 "43ae6097e29a10025141810ecd213bb85cf70c7d2e82245c6f1ac567929e5e5e"

  def install
    bin.install "croc"
  end

  test do
    system "#{bin}/croc --version"
  end
end
