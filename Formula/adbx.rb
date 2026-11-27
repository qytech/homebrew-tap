class Adbx < Formula
  desc "Enhanced cross-platform ADB with session locking, broadcast, TUI logcat & MCP"
  homepage "https://github.com/Jax-Lifu/adbx-rs"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.1/adbx-v0.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "0e7f41cd6d0a4d23abd46fc833715684448c2fb603ce9222de8bb670977ccbe7"
    else
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.1/adbx-v0.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "1519c98cb9391c07acb188b187380452f17d711741b29e718838d0bd954da35c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.1/adbx-v0.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb6c3d86d937cbb51e3d62087b352eba918fbf7df4b6f144705887a6ef20169d"
    else
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.1/adbx-v0.0.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e96803d02c6f7e191bb3b7580d2ff59f7dea0fe6210b6559e189a4ef22221fb1"
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
