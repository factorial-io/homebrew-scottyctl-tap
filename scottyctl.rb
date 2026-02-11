class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.9"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.9/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "9cd1a48b934b252e6e4a0538eeb0c8e96adbb280c39d36186e03deb65e343884"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.9/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "0d02f8a99c2323199fbeababe76b4d2d7f65cb067be29fefce2e879a0ea582a9"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.9/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6254e24d2cc6ad1097df20c093e8180703e65e7fabe182a8cc32180ee1410cb8"
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
