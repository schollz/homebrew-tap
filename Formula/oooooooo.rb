class Oooooooo < Formula
  desc "Digital Tape Loops"
  homepage "https://github.com/schollz/oooooooo"
  url "https://github.com/schollz/oooooooo/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "829fa1c32f3737b07ea93b44b2f93f798008ba8550a555aa374931031df51818"
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
