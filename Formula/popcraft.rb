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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.4/popcraft-0.9.4-darwin-arm64.tar.gz"
      sha256 "dbd08ff19cdf950fde0412e2aa1e499f2dc2f7d96e491e7cdb80d48e243c0b54"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.4/popcraft-0.9.4-darwin-x64.tar.gz"
      sha256 "ec3fa1e9f4bd9e16f5c1d428046936b2a127400ffa147738a2930dc584c12f53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.4/popcraft-0.9.4-linux-arm64.tar.gz"
      sha256 "c4a70e63e7edf36af135fba76269a4988101d509135d1e49074d092a2a9b0478"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.4/popcraft-0.9.4-linux-x64.tar.gz"
      sha256 "6321c938da61863b1420434d8082cc196d20b3a97b16786fb57b9e3714d43cc9"
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
