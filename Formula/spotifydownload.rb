# This file was generated by GoReleaser. DO NOT EDIT.
class Spotifydownload < Formula
  desc "spotifydownload allows you to download playlists from Spotify."
  homepage "https://schollz.com/software/spotify/"
  version "0.7.9"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/schollz/spotifydownload/releases/download/v0.7.9/spotifydownload_0.7.9_macOS-64bit.tar.gz"
    sha256 "e7601a7a2ff4c0bb1e2407063373b01f39f85acc2974e3ec519930b60ec6083f"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/schollz/spotifydownload/releases/download/v0.7.9/spotifydownload_0.7.9_Linux-64bit.tar.gz"
      sha256 "c976bc3c86cbd1446e2e59ce020a65f092a39c17cc7148c2d72ca33cb9a29488"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/schollz/spotifydownload/releases/download/v0.7.9/spotifydownload_0.7.9_Linux-ARM64.tar.gz"
        sha256 "9c8781017ab3cb49524415d6336c3add73281ee97e22464f13ab84496671147f"
      else
      end
    end
  end

  def install
    bin.install "spotifydownload"
  end

  test do
    system "#{bin}/spotifydownload --version"
  end
end
