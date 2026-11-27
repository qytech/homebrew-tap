class Adbx < Formula
  desc "Enhanced cross-platform ADB with session locking, broadcast, TUI logcat & MCP"
  homepage "https://github.com/qytech/adbx-rs"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.3/adbx-v0.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "13ca4c965fb1e159b922d3471e4bb32f3bc395fda7cc95b39dc6dba42395c5b0"
    else
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.3/adbx-v0.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "277aec356042cfeb039bbb775e7548debfd605d50c0656e2961099cda1e68a8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.3/adbx-v0.0.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5023751e58576980aabca513876a16c253c529f66ed4a1d9bdb567f266060065"
    else
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.3/adbx-v0.0.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c9f8221372802dcd9411d80a06c8b54c964fd8139319f7878ee9df678807a012"
    end
  end

  def install
    bin.install "adbx"
  end

  def caveats
    <<~EOS
      If `adb` is not already installed:
        brew install --cask android-platform-tools
      Or let adbx download official platform-tools automatically:
        adbx setup-adb

      Enable dynamic shell completion (including remote device paths):
        Zsh:  source <(COMPLETE=zsh adbx)
        Bash: source <(COMPLETE=bash adbx)
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/adbx --version")
  end
end
