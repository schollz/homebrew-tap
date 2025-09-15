class Collidertracker < Formula
  desc "Musical performance tool for live coding and improvisation"
  homepage "https://github.com/schollz/collidertracker"
  url "https://github.com/schollz/collidertracker/releases/download/v3.0.3/source_code_vendored.tar.gz"
  sha256 "7f4bbb34e9a1d67ee9032895119242191bc089d87d43e68fa429b98c9a677a5c"
  version "3.0.3"
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
