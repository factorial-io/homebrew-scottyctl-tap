class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.2.3"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.3/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "0e471ab4d7d47795048ef15fa8469c0cb3a50aed743d76e0fab9701913111a90"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.2.3/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "6baeaea294c23492c8a7d37c82d34c453f52ac693b7e70193ccb7adbe2426267"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.2.3/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cd8b39e00959faf75e0ecf383c69d83cdf3100d78fd6dbbc2792bdaf22da5728"
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
