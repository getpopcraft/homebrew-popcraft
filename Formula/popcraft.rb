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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.0/popcraft-0.8.0-darwin-arm64.tar.gz"
      sha256 "6fddbe429be10e27197c066ae54dff36909d10ca7c9647031bc32fbf07d8960b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.0/popcraft-0.8.0-darwin-x64.tar.gz"
      sha256 "6558c2c4b7f2d729ffa718f443dd0334098e09e45546bd8ffb96c6d6ed77c48c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.0/popcraft-0.8.0-linux-arm64.tar.gz"
      sha256 "43c8fc9318c61960334b9fbd9ef1ce80507bc1387b4204c223fe80110e88a939"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.0/popcraft-0.8.0-linux-x64.tar.gz"
      sha256 "2f9fc03fa523faf86ae6ad806780ab7fd8bac0d4e2c874474af3bf8e297ddadf"
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
