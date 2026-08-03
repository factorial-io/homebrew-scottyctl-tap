class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.3.4"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.4/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "5efe22227e3824dbc0087e62fb9017da287ed9e00ae5c420effddae53ff64f96"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.4/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "96c6c0ab4c34fb83d969ef39f16d1507e076a06f5b6be5efeee97c0980ea6110"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.3.4/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "42ffc92b2b47ab1754caf45e974beed9882ff5a265a2fcaf06f9331eb61d06bd"
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
