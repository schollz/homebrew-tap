# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  url "https://github.com/schollz/croc/releases/download/v6.2.3/croc_6.2.3_macOS-64bit.tar.gz"
  version "6.2.3"
  sha256 "c3c56773e9572a0ee1c6bb5035338e897602fdd11dd5df2fb0019897fbd9dbeb"

  def install
    bin.install "croc"
  end

  test do
    system "#{bin}/croc --version"
  end
end
