class Tune < Formula
  desc "Musical performance tool for live coding and improvisation"
  homepage "https://github.com/schollz/2n"
  url "https://github.com/schollz/2n/releases/download/v2.0.4/source_code_vendored.tar.gz"
  sha256 "0db2d4e5deaac42e6245a34aa9479fbfe472cdab5800c043cae0d926e3bc7385"
  version "2.0.4"
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
