class Collidertracker < Formula
  desc "Musical performance tool for live coding and improvisation"
  homepage "https://github.com/schollz/collidertracker"
  url "https://github.com/schollz/collidertracker/releases/download/v4.3.4/source_code_vendored.tar.gz"
  sha256 "eca8d96ec074c8b6c7a92b61878d14146e7636fb6dc1ad0978af332abf42fc9a"
  version "4.3.4"
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
    system "go", "build", "-v", "-mod=vendor", "-ldflags", "-X main.Version=#{version}", "-o", "collidertracker"
    bin.install "collidertracker"
  end

  test do
    system "#{bin}/collidertracker", "--help"
  end
end
