class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.3.2"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.2/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "93ff17a41554f8b0b77ad6005f9f49d7baa9bbfa8326230a1d6ac99aeaa43aac"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.2/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "c1a1f758121fb1ffb569688f0363d03e1550ea9e091b2b57c44146cd2949501e"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.3.2/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5f50c402fb61904331e8138848d57eb78ee3ba1e6aa33e52cf7877232a10d074"
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
