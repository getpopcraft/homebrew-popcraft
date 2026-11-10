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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.5/popcraft-0.63.5-darwin-arm64.tar.gz"
      sha256 "8eee33cb63614ee5c892bf10c7468be0f45de1609d3cec7c33d89ca6b1bad725"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.5/popcraft-0.63.5-darwin-x64.tar.gz"
      sha256 "bdd7383bfc7bea47106d3f9c00d483869c326e5de80c88dbc46f9b6fcd1aa313"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.5/popcraft-0.63.5-linux-arm64.tar.gz"
      sha256 "b95743934cf264a518bd677da92f9274bc5b90576f876df0172aba1dc8a8b957"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.5/popcraft-0.63.5-linux-x64.tar.gz"
      sha256 "f0b9b938beeafb983b82e2e743c04952129f5bf3a0f81c4fc9b84ac643624443"
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
