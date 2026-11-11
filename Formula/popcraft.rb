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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.3/popcraft-1.5.3-darwin-arm64.tar.gz"
      sha256 "0e0db987ce52c8e1c6224c9d1cb5faed6361be94496bc04c3f233d60f851bc6c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.3/popcraft-1.5.3-darwin-x64.tar.gz"
      sha256 "378cea438e9906c58013c294a6a170e8fc29ea78cb70cbf7dac15857888e924a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.3/popcraft-1.5.3-linux-arm64.tar.gz"
      sha256 "38da077567251606796cb70475c52fcddfd434147c72d8db49daca7898e40882"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.3/popcraft-1.5.3-linux-x64.tar.gz"
      sha256 "9de2f442a32aacfe77accb07952099e245ef122154a9eda17f645417f0ead29c"
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
