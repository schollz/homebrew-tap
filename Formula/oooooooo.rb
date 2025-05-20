class Oooooooo < Formula
  desc "Digital Tape Loops"
  homepage "https://github.com/schollz/oooooooo"
  url "https://github.com/schollz/oooooooo/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "7b93dd1377e151f5bc2a80150de05d5e77b598ee4910b2767467b2d1b8c5a2c4"
  license "MIT" # Update with actual license
  head "https://github.com/schollz/oooooooo.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "flac"
  depends_on "jack"
  depends_on "liblo"
  depends_on "libsndfile"
  depends_on "rtmidi"
  depends_on "sdl2"
  depends_on "sdl2_ttf"

  def install
    # Explicitly set PKG_CONFIG_PATH to include Homebrew's lib/pkgconfig
    ENV.prepend_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/lib/pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/opt/jack/lib/pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/opt/liblo/lib/pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/opt/libsndfile/lib/pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/opt/sdl2/lib/pkgconfig"
    ENV.prepend_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/opt/sdl2_ttf/lib/pkgconfig"
    
    # Set include and lib paths
    ENV.append "CXXFLAGS", "-I#{HOMEBREW_PREFIX}/include"
    ENV.append "LDFLAGS", "-L#{HOMEBREW_PREFIX}/lib"
    
    # Handle submodules if they're not included in the tarball
    system "git", "submodule", "update", "--init", "--recursive" if build.head?
    
    # Create build directory
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      bin.install "clients/oooooooo/oooooooo"    end
  end

  test do
    # Add a basic test
    system "#{bin}/oooooooo", "--version" rescue true
  end
end
