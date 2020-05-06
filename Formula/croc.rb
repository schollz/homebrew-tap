# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.0.10"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.0.10/croc_8.0.10_macOS-64bit.tar.gz"
    sha256 "3f06920860310f6f5c173d4ff3a811537be4f43e85dd8ddc9f48020babd95031"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.0.10/croc_8.0.10_Linux-64bit.tar.gz"
      sha256 "18772a57f29ce30285c2f67d5a943a4687b04b2e7c33be5a0a38c2915855994e"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.0.10/croc_8.0.10_Linux-ARM64.tar.gz"
        sha256 "c9ae9d14aa8971b8f5411dacf47c4a7248e44b952cbce809f16166fa8b14fc6b"
      else
      end
    end
  end

  def install
    bin.install "croc"
  end

  test do
    system "#{bin}/croc --version"
  end
end
