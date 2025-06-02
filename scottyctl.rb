class Scottyctl < Formula
  desc "CLI tool for scotty PaaS"
  homepage "https://github.com/factorial-io/scotty"
  version "0.1.0-alpha.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.32/scottyctl-aarch64-apple-darwin.tar.gz"
      # Replace with actual SHA256 after release
      sha256 "ed265624abac42c8c348bdc1f812b3fd74e7f210c382e673d9d0984288118a7c"
    elsif Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.32/scottyctl-x86_64-apple-darwin.tar.gz"
      # Replace with actual SHA256 after release
      sha256 "c3a1b0548537d2295eb44895619e3a92bf8d2df8e50e9e3353cbdf57351f90e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/factorial-io/scotty/releases/download/v0.1.0-alpha.32/scottyctl-x86_64-unknown-linux-gnu.tar.gz"
      # Replace with actual SHA256 after release
      sha256 "788890375f2f68698fa5b8d8c1f224f5f54ca5ff7cf03b9290eb597066721d7e"
    end
  end

  def install
    bin.install "scottyctl"
  end

  test do
    system "#{bin}/scottyctl", "--version"
  end
end
