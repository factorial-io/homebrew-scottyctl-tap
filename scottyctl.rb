class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "223d41751ffa2f54ec68bcea6395131cc47c4b2625e0e3ad8e87579eafc9e71e"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "b33b317833b0e5c3cda09b4ba7f336323d6f19987d8b2959bfe7cf4b0b058f40"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.1.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "038c98f84db9d9a9a4cc4cfcf7eff1f8da00b1ba0d23c2b9d188b8463f801307"
  end

  def install
    bin.install "scottyctl"
  end

  test do
    system "#{bin}/scottyctl", "--help"
  end
end
