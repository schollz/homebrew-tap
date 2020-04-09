# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.0.6"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.0.6/croc_8.0.6_macOS-64bit.tar.gz"
    sha256 "c365b7db3aabf39ccd1fa66234a8dd696e15b707f150cb7883190fe73f38c6a4"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.0.6/croc_8.0.6_Linux-64bit.tar.gz"
      sha256 "0eabdb0ca0feec30f4e906f657e01046bc67bf399211bc81fedd3ef044701fa8"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.0.6/croc_8.0.6_Linux-ARM64.tar.gz"
        sha256 "d20f5c0180627c927edc195b0d19da1cbb23042a7dbe625202f5aa34332f1a40"
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
