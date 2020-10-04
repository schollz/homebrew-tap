# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.4.0/croc_8.4.0_macOS-64bit.tar.gz"
    sha256 "8b588f7169126b5c35aff40af99a2b6e0a15c34aa3dde19f0d8c3d20d7da20b5"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.4.0/croc_8.4.0_Linux-64bit.tar.gz"
      sha256 "33dd3cb948f5c7e22f4517ea43bdf983283c2cf8e0c19ca1eb906d71c3fb5fea"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.4.0/croc_8.4.0_Linux-ARM64.tar.gz"
        sha256 "a01649678e43e5e0e9f8943fc95fa319682484cec56e761dfaf53fb4fc9b9b39"
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
