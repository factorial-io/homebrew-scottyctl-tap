class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.6.0"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.6.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "00c25b5b63eba4021be6ec05573fb28a093beb3e3d067d1078b167042ef549b8"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.6.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "b68a8308cbe8b6b9634dccf0fb17abdca1ac7935baf3564a343bd5612928c5fb"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.6.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e53e897bc9382ca24d762c7a43a90f604476139a7a64eea4a26efd52bb369a20"
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
