# This file was generated by GoReleaser. DO NOT EDIT.
class Croc < Formula
  desc "croc is a tool that allows any two computers to simply and securely transfer files and folders."
  homepage "https://schollz.com/software/croc/"
  version "8.6.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/croc/releases/download/v8.6.3/croc_8.6.3_macOS-64bit.tar.gz"
    sha256 "f8233521d8d274b996776b38e0a94b12e67fc0e775087a032ecd4bd2e12a943b"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/croc/releases/download/v8.6.3/croc_8.6.3_Linux-64bit.tar.gz"
      sha256 "028c5427caa08fe3652299fee6f41ee2dd2a12367d7d48d61f2aeb515c6369f9"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/croc/releases/download/v8.6.3/croc_8.6.3_Linux-ARM64.tar.gz"
        sha256 "dd3c4314e702f9a560ddfcf18f475a366a0918da8eb26c51030a7fa84dc3a3d2"
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
