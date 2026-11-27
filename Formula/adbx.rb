class Adbx < Formula
  desc "Enhanced cross-platform ADB with session locking, broadcast, TUI logcat & MCP"
  homepage "https://github.com/Jax-Lifu/adbx-rs"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.2/adbx-v0.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "fb667568f4d7fcbf837fede837d1594889b631aadad302fc5f9d5114d58abb1d"
    else
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.2/adbx-v0.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "436887cd353f12828d6a9de6b3b42b5d1e35713dcd0cd31b84fc669ce83b71fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.2/adbx-v0.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "129ce655a522f04bf14e3e87a0f0153837451e2eb32161e0a9d1028008982a46"
    else
      url "https://github.com/Jax-Lifu/adbx-rs/releases/download/v0.0.2/adbx-v0.0.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7586348569c9896231d0672e0cfb177531dc643e75b5b9cded4c07d9a4d2d824"
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
