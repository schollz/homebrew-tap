# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "6.4.8"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v6.4.8/croc_6.4.8_macOS-64bit.tar.gz"
    sha256 "764aa3cc44396d92715ac25df7b176bbe199442418fe8df7a095b463c1c3c8af"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v6.4.8/croc_6.4.8_Linux-64bit.tar.gz"
      sha256 "8e8758decdda3ab2f5c5d10f6eeabdd5d501dcc8ad2e429208539457dbc761bd"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v6.4.8/croc_6.4.8_Linux-ARM64.tar.gz"
        sha256 "11f02be78a709bb3e3f9cb8b2c6a2cc7c2768bf1c97a5bd912fff12daf29ee1b"
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
