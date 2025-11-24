class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.0"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
  end

  depends_on "rust" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "56915184c7e7af7578ee26b6b93082060883c073d8ebc14436adc15f116035c7"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "d458d51cbb1c80e370d7ad0acc225f9d82d6768104b4817d09f94d458a74bcda"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "49fc0f1c210ac228354e0098a6c1e8afc76c0b866fb790daafa6052aa6456a5c"
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
