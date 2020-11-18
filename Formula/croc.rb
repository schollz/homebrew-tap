# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.6.6"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.6.6/croc_8.6.6_macOS-64bit.tar.gz"
    sha256 "7eabda194b86be945ff7bcefa53fa52ebf0907390760b548c127a62756d5a9f9"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.6.6/croc_8.6.6_Linux-64bit.tar.gz"
      sha256 "3ac6124e87ea89988685aa6a4d9ddf6cb4e5ddb8fd2d78838536745993a858d6"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.6.6/croc_8.6.6_Linux-ARM64.tar.gz"
        sha256 "6a093f5c8485be7597ca372ad72b3231da64d01cbdb79b7b660abe15df1a8014"
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
