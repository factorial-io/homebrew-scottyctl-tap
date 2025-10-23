class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.1.0-alpha.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.38/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "6983037f982d6c955c0eed35387ef7f22c12593776d520914ee08494aa9ae39d"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.38/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "d240d82726d9d706691daca5d150b80fec22a7b89a35a42b46cccc217683b1af"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.38/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d94ae56cbe9776bef6cfed87b2482bc0f00f162fa83e0fb52440ed77abf81fe8"
  end

  def install
    bin.install "scottyctl"
  end

  test do
    system "#{bin}/scottyctl", "--help"
  end
end
