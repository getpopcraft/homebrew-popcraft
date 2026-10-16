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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.6/popcraft-0.42.6-darwin-arm64.tar.gz"
      sha256 "430215abe9915d3de344b855898b5d5e939d89a21a9a24dead934cc52eb7acea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.6/popcraft-0.42.6-darwin-x64.tar.gz"
      sha256 "3031e16ebb3b0f32b5b61ccbf44b49b31cb85e6cf51fc82aa024b0784b3aa867"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.6/popcraft-0.42.6-linux-arm64.tar.gz"
      sha256 "53a0a1ae486c9c153bc19ef47fcbf9e79cca296d9a2501bb9c6bd195b9998ad0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.6/popcraft-0.42.6-linux-x64.tar.gz"
      sha256 "b412033ccf8636f3a1eeaaacdbcc187fc421dff7277a1c488ef99d4f047908a8"
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
