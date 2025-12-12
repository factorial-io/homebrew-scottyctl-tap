class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.6"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.6/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "ef2a4cc9b050ac4e41df1fb79bd8ed0df0923dd65dcff39ff93258a889d931ba"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.6/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "916608d64b928a6758ba8356803d9038ff996cf1c19cb28a39108d1f8720d22c"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.6/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4497edc4b5b3b6d31959ddc0f07cbf143bedaf21aa873e5c85611a28fd7ae8b9"
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
