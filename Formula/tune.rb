class Tune < Formula
  desc "Musical performance tool for live coding and improvisation"
  homepage "https://github.com/schollz/2n"
  url "https://github.com/schollz/2n/releases/download/v2.0.5/source_code_vendored.tar.gz"
  sha256 "5a144416390006f5e75d9af477a1694ad88553480c95847560728b3797b83912"
  version "2.0.5"
  license "MIT"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "sox"
  depends_on "rtmidi"

  def install
    # Set up CGO environment variables for rtmidi
    ENV["CGO_ENABLED"] = "1"
    ENV["CGO_CXXFLAGS"] = "-D__RTMIDI_DEBUG__=0 -D__RTMIDI_QUIET__"
    
    # Build with proper flags matching the main workflow
    # Use -mod=vendor to use vendored dependencies
    system "go", "build", "-v", "-mod=vendor", "-ldflags", "-X main.Version=#{version}", "-o", "2n"
    bin.install "2n"
  end

  test do
    system "#{bin}/2n", "--help"
  end
end
