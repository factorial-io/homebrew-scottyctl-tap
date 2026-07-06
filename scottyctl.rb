class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.3.3"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.3/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "a6d5ed2c7feb2d3ae78c4528106541029094372a03577fff25a62bc87229d239"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.3/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "c9f86215dbf06bc6fda86cb36c63b7f8684a4f3f74785d111249e2dcc5b98423"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.3.3/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ecc2927304c81ec11fc2a95ead3c38e01ebc1eb50c68e5dda9a084e975a2349f"
  end

  def install
    if build.head?
      system "cargo", "install", "--path", "scottyctl", "--bin", "scottyctl", "--root", prefix
    else
      bin.install "scottyctl"
    end
  end

  test do
    system "#{bin}/scottyctl", "--help"
  end
end
