class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.5"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.5/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "a1f6e7d84663e5c7a8ef787b0e5a64e1a7d8c7ac9e32226280fbcd64dd983329"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.5/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "90ce3c49358ed6d1bb414e5f6840c50c4b3103042135c92bb2020a952fac6e4a"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.5/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "96d79563a78d38659e2e8addb3489b6bb97af8723644eab1b8274ef8ce42a189"
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
