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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.0/popcraft-0.39.0-darwin-arm64.tar.gz"
      sha256 "ee6ebb1e241c9b65526be7585babfa6233d60e875a809b18de0829eed9199f25"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.0/popcraft-0.39.0-darwin-x64.tar.gz"
      sha256 "b7120efeece848a0a5e39ae3c892ba8594ff552bdd19a9e5b8bd40c0a78dc6d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.0/popcraft-0.39.0-linux-arm64.tar.gz"
      sha256 "96167131197166a076553a0c5f24d6a93e75c6439d675884880a8be725712562"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.0/popcraft-0.39.0-linux-x64.tar.gz"
      sha256 "8a584c5c30eb6be729f2714a46dd0ad5ad410a4bd3c8177cf46899767fd42763"
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
