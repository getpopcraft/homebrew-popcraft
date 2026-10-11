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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.33.0/popcraft-0.33.0-darwin-arm64.tar.gz"
      sha256 "7cccabac664ec072556b907f2617648a300acf47b8184d6f09e5b88d64b0c1a1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.33.0/popcraft-0.33.0-darwin-x64.tar.gz"
      sha256 "0416a3c6a35ad2bbf6fc7f7ca57fc77103dc890d4b8a4b9027d9394f02ed742c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.33.0/popcraft-0.33.0-linux-arm64.tar.gz"
      sha256 "1c0b1370d19ddbad12a5d8b884d7ec8fed21051f704b7d911273283e2729db03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.33.0/popcraft-0.33.0-linux-x64.tar.gz"
      sha256 "af6a5fa1f8ccdd6e2ddb532ae8a3b277eab891d5aba127396645e67b34b7993d"
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
