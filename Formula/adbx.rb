class Adbx < Formula
  desc "Enhanced cross-platform ADB with session locking, broadcast, TUI logcat & MCP"
  homepage "https://github.com/qytech/adbx-rs"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.4/adbx-v0.0.4-aarch64-apple-darwin.tar.gz"
      sha256 "48c7e37cb790d1aa3d15947dfa0df208b56c5d4ec2f2f1b7c1177232fd3264bd"
    else
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.4/adbx-v0.0.4-x86_64-apple-darwin.tar.gz"
      sha256 "af09eb83a75521dd56c41870d95f50fd3bedee0285eda6b684003ab6632a573d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.4/adbx-v0.0.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "058736cfda2c39e47bcce5370be6af243bd13fad508ec94e4b6a49fe94866700"
    else
      url "https://github.com/qytech/adbx-rs/releases/download/v0.0.4/adbx-v0.0.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f1709513269729b05c507c660aae4ce3918437b703ae938f02e69f1dc49de5a"
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
