# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.6.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.6.1/croc_8.6.1_macOS-64bit.tar.gz"
    sha256 "85fb6bd2496a76916b6da3b3ee4904086a1a2b2a21f116e9fc929a59379b6a14"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.6.1/croc_8.6.1_Linux-64bit.tar.gz"
      sha256 "4eed7f0f63fe1f47643882b4d3ce80d1aa3ebab060180b140c27ec2e3810a382"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.6.1/croc_8.6.1_Linux-ARM64.tar.gz"
        sha256 "a584999e18a86189424d8b436ec76bd67bb7aa97ecf80b1602b74640bb695646"
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
