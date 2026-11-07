class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.4.0"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.4.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "d61b583abc9adf815ef300cbade840e4532a9e74794be0015ac9ca941726bcb3"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.4.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "11160b05a32717ab3f01ee2f2ec088bcd229841a7b9e778ed6cb914e0e6dd01b"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.4.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7a527d9cccd0069aa73a75da62214e1816a3b5b3b6d6626f8f698ff956e9eb06"
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
