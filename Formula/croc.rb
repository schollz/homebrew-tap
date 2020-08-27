# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.1.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.1.0/croc_8.1.0_macOS-64bit.tar.gz"
    sha256 "a6b9193988ca74232ff686b5b6108ee56835b0a0a954f43594945b5be238aed0"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.1.0/croc_8.1.0_Linux-64bit.tar.gz"
      sha256 "965a3a8706dc97f0a8e83757859114763bcc2ee7c047b50c086ee1521e5852fa"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.1.0/croc_8.1.0_Linux-ARM64.tar.gz"
        sha256 "d0c0f7fbcd0c3c8675f59c59d9ec289d83789178b14938dfdde82c69d5aca1b9"
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
