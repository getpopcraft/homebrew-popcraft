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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.7/popcraft-0.61.7-darwin-arm64.tar.gz"
      sha256 "01c1a7f18d8002f7a830359ce10cc70cb0f07ba6e6d1c010144476bfc0ba3036"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.7/popcraft-0.61.7-darwin-x64.tar.gz"
      sha256 "7e65dbeb5bd70c093ba35af801e38621ef2a3323cce6f4826e7006804d21db7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.7/popcraft-0.61.7-linux-arm64.tar.gz"
      sha256 "b8113ede5e557972cba6a96b84b467c349089d374ddd768e3e492ebf077db614"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.7/popcraft-0.61.7-linux-x64.tar.gz"
      sha256 "12c5ad26d2c760cad1f1f35335d556c57f67bfbfd87ff41e23ebdbe212421590"
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
