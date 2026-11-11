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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.0/popcraft-1.3.0-darwin-arm64.tar.gz"
      sha256 "3bd94e603594d1434ca76e73fcdb3a49c4c44537be7e275505607d3fe993d6a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.0/popcraft-1.3.0-darwin-x64.tar.gz"
      sha256 "9718fb79734ef901b7208d15821db44b1bbc739a4d4b299266864342fa76c693"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.0/popcraft-1.3.0-linux-arm64.tar.gz"
      sha256 "7660f45ac76635a083e4a465053d8a573c979aaefdb65cea2ea1aba6448de256"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.0/popcraft-1.3.0-linux-x64.tar.gz"
      sha256 "340637b0df7051e2d4e0ac32f85bb02c8525c8880467db2a61d6842269314530"
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
