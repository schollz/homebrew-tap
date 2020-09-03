# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.2.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.2.1/croc_8.2.1_macOS-64bit.tar.gz"
    sha256 "9a927295dbf4288fed7733bcb6a20cf0823ede1b02c4ab77489481370693d4c9"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.2.1/croc_8.2.1_Linux-64bit.tar.gz"
      sha256 "1b433164dc3b4a344caa36fb5cb3b2ba8a195f21f9b94810486e0dbf19fc628a"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.2.1/croc_8.2.1_Linux-ARM64.tar.gz"
        sha256 "ff94233e3ed8eb89d50641791bb95cc9b0f4ff92efd5e9b83dcc323840fd9b45"
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
