# typed: false
# frozen_string_literal: true

# The `popcraft` command line: one executable with the design kit inside (compiled with bun), no Node needed.
# npm has the same CLI as @popcraft/cli. Written by .github/workflows/update-formulas.yml; don't edit by hand.
class Popcraft < Formula
  desc "Command-line for PopCraft: edit .popcraft files, call the API, publish plugins"
  homepage "https://popcraft.app/docs/api/cli"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.16.0/popcraft-0.16.0-darwin-arm64.tar.gz"
      sha256 "11beac96c5951380d61c532e4ed11bd497000dd2b8db08576ea8f9794e4af4c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.16.0/popcraft-0.16.0-darwin-x64.tar.gz"
      sha256 "fd559cedbaf5222ed1c56748602b5a3af3a273ac2f43d4eda281f54d4aa26492"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.16.0/popcraft-0.16.0-linux-arm64.tar.gz"
      sha256 "998f14de6268ce174794acbcdc0f2437a78f2c8f38ee4ae660f36bc339513156"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.16.0/popcraft-0.16.0-linux-x64.tar.gz"
      sha256 "08b8a640f263f49419f6383d2e297cd558207fb8068afca945cc771267a11859"
    end
  end

  def install
    bin.install "popcraft"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/popcraft --version").strip
    system bin/"popcraft", "new", testpath/"t.popcraft", "--name", "Test"
    assert_path_exists testpath/"t.popcraft"
  end
end
