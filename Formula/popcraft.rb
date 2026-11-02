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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.5/popcraft-0.56.5-darwin-arm64.tar.gz"
      sha256 "195aec667968b8a7ffe1323659c59837e316cd589d846d6fc8bcebafb9fb1da8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.5/popcraft-0.56.5-darwin-x64.tar.gz"
      sha256 "dabec83540ffde602e9549561ccf11dd6e86bdd8a021a4b9c44b0de995d90af5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.5/popcraft-0.56.5-linux-arm64.tar.gz"
      sha256 "d22d995905461da6740fea193b92c063f77f43c51c61ed540c3123d8a3b1bba5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.5/popcraft-0.56.5-linux-x64.tar.gz"
      sha256 "f4ed47d2a28bb48958a8f55c043f3d5bcdc4f3a0cf045e138f6cd21c8323a166"
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
