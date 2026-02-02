class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.7"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.7/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "ffae7a2a013b96b8a94c0113852f8683fcdc9df66a83a18438312fce05473316"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.7/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "c332dc5492c589bee256f8bbeaad4fba85182e191eeb125ca6292bb483baf037"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.7/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5dc33b408d55640ff0a9c8fd297d543ad65ecbd009d87c3494017afc704e558f"
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
