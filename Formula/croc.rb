# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  url "https://github.com/schollz/croc/releases/download/v6.0.4/croc_6.0.4_macOS-64bit.tar.gz"
  version "6.0.4"
  sha256 "e9fda54c6f829adb71b13d6800c306c463f342a88a12beadee1dcaf062561ef4"

  def install
    bin.install "croc"
  end

  test do
    system "#{bin}/croc --version"
  end
end
