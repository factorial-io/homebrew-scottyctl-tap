class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.3.1"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.1/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "cd7d5542b2007e8355d821bbe7cc683c4e79adc12de77a61cf7443877dee47fe"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.1/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "796fa1552374ccc3f6819b78bc3e21f5e41d74fff7756f9d740bfa67bdf042d5"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.3.1/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba168470e30277f37f91cc7754a1ebcb28301fdf339b4ff3d7278bec2d516d69"
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
