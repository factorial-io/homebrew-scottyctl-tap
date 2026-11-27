class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.7.0"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.7.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "c133ed9d0dd5ad0f9d282e9a0bd53372c1ca84fa0260e27f81c603ed82d28a2b"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.7.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "7533148777674f10c8315c61515ed4a940b46e3f45f42dcc6f6b17d27bbfeaf7"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.7.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c5f171c1ff14324f1f17182ff595dd1eb347c6d9a4b07ff5c4d34c18e4536be"
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
