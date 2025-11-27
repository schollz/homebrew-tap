class E2ecp < Formula
  desc "Secure E2E encrypted file transfer using ECDH and AES-GCM"
  homepage "https://github.com/schollz/e2ecp"
  url "https://github.com/schollz/e2ecp/releases/download/v3.2.0/source_code_vendored.tar.gz"
  sha256 "6d712ca61cf0e6d1b5b334c7dd7b12478ab2397c76ab4f64d72b185ef032db50"
  version "3.2.0"
  license "MIT"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    # Install web dependencies
    system "npm", "install"

    # Install web dependencies
    cd "web" do
      system "npm", "install"
    end
    
    # Build web assets
    cd "web" do
      system "npm", "run", "build"
    end
    system "touch", "web/dist/.keep"
    
    # Build with proper flags using vendored dependencies
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", "-v", "-mod=vendor", "-ldflags", "-X main.Version=#{version} -extldflags '-static'", "-o", "e2ecp"
    bin.install "e2ecp"
  end

  test do
    system "#{bin}/e2ecp", "--help"
  end
end
