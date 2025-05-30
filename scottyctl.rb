class Scottyctl < Formula
  desc "CLI tool for scotty PaaS"
  homepage "https://github.com/factorial-io/scotty"
  version "0.1.0-alpha.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v#{version}/scottyctl-aarch64-apple-darwin.tar.gz"
      # Replace with actual SHA256 after release
      sha256 "REPLACE_AARCH64_APPLE_SHA"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v#{version}/scottyctl-x86_64-apple-darwin.tar.gz"
      # Replace with actual SHA256 after release
      sha256 "REPLACE_X86_64_APPLE_SHA"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v#{version}/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
      # Replace with actual SHA256 after release
      sha256 "REPLACE_X86_64_LINUX_GNU_SHA"
    end
  end

  def install
    bin.install "scottyctl"
  end

  test do
    system "#{bin}/scottyctl", "--version"
  end
end