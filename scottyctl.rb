class Scottyctl < Formula
  desc "CLI tool for Scotty"
  homepage "https://github.com/factorial-io/scotty"
  version "v0.5.0"

  head do
    url "https://github.com/factorial-io/scotty.git", branch: "next"
    depends_on "rust" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.5.0/scottyctl-aarch64-apple-darwin.tar.gz"
      sha256 "1886c4d777e3a3c870dbbcf7cbed32dd6754f3f67806704170204655f0d02fa7"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.5.0/scottyctl-x86_64-apple-darwin.tar.gz"
      sha256 "9926a8c0eb7c135fa2aa323ac26b401ee0ff82414035888bdf7e304968287843"
    end
  end

  on_linux do
    url "https://github.com/factorial-io/scotty/releases/download/v0.5.0/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "22b491e81d08140e55e94d40cf7701c0a2ff5080bb039967386f08947caa992e"
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
