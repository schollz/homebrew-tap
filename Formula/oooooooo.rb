class Oooooooo < Formula
  desc "Audio application by schollz"
  homepage "https://github.com/schollz/oooooooo"
  url "https://github.com/schollz/oooooooo/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "5ea1a466e9d8aafe176bc986e462b6eaff83c630138fd25c1e8b07cbc0fcde10" # Replace with actual SHA256
  license "MIT" # Update with actual license
  head "https://github.com/schollz/oooooooo.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "flac"
  depends_on "jack"
  depends_on "liblo"
  depends_on "libsndfile"
  depends_on "rtmidi"
  depends_on "sdl2"
  depends_on "sdl2_ttf"

  def install
    ENV.append "PKG_CONFIG_PATH", "/opt/homebrew/lib/pkgconfig:/usr/local/lib/pkgconfig:#{ENV["PKG_CONFIG_PATH"]}"
    ENV.append "CXXFLAGS", "-I/opt/homebrew/include -I/usr/local/include"
    ENV.append "LDFLAGS", "-L/opt/homebrew/lib -L/usr/local/lib"

    system "make"
    bin.install "oooooooo" # Update with actual binary name
    
    # Add any additional installation steps here
    # For example, if you need to install resources or documentation
    # prefix.install "resources"
    # doc.install "docs"
  end

  test do
    # Add tests to verify installation
    system "#{bin}/oooooooo", "--version"
  end
end
