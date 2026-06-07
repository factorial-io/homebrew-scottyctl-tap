class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.3.0"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "664d162c3fcacb61d7d90ebed60d90aa73c3942a8f8cbf00f7a983e95b7bebe5"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.3.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "6490a74303451b7f7cfd8ddcd365e5aa7ba8788b4c9dc8ac63fbe3e092bbc5f2"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.3.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc1907cf62c953b90fbdb36c1ddb654f33184e0efdaf0fca18b3023548baf2cb"
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
