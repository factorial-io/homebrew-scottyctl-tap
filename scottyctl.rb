class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.1.0-alpha.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.37/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "652c9e68f4172b2be198cb2c47804e55d91cf21ba41ec5a765a30d3de058d895"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.37/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "b5dbc6cc201268203a400c6c5e2f8aa7887de748a0ea5e818c56bc2a162f3fcc"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.37/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "377884dbbcf3ed9d2bd2955d58615a4f84277bb63fd613445126f49a11f88223"
  end

  def install
    bin.install "scottyctl"
  end

  test do
    system "#{bin}/scottyctl", "--help"
  end
end
