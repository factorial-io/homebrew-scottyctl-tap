class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.4"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.4/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "9ffa78018f51649f0592d25b981c2b00fe90a83942ab40c42f4007ada746c899"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.4/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "b1565efcc751605b68e72f8f8e89ef3a7c96d5f310b4d209351b34fb3efe399e"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.4/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ed34705dbe9e04555a6a3eadb74e5870ae4bcfcf0d1d6e0ebb5845d709fa5c84"
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
