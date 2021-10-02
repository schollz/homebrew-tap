# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "9.4.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v9.4.0/croc_9.4.0_macOS-64bit.tar.gz"
      sha256 "8ea2b0af7573b3351c5befe522158d96c9fd5b779478465f06bf47d89f2a19e6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/schollz/croc/releases/download/v9.4.0/croc_9.4.0_macOS-ARM64.tar.gz"
      sha256 "75d4f840d8e4276e26a3a37dd38ca69b3b0e70d2bf94a99091757f872ea2cec5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v9.4.0/croc_9.4.0_Linux-64bit.tar.gz"
      sha256 "e4e8e65ac6c99b8bf038ac9cc32d99c5d3b511e26ebafff7db7bd2fc01f01af0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/schollz/croc/releases/download/v9.4.0/croc_9.4.0_Linux-ARM64.tar.gz"
      sha256 "225214577814e2babb839a8c1ed658ead9b184b36ac53642eaec234732f8705d"
    end
  end

  def install
    bin.install "croc"
  end

  test do
    system "#{bin}/croc --version"
  end
end
