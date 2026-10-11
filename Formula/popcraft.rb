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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.29.0/popcraft-0.29.0-darwin-arm64.tar.gz"
      sha256 "d1a2de3c4dc69e6d44657df15e26b277ab0fe404e386008d33d09e77eae1b3fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.29.0/popcraft-0.29.0-darwin-x64.tar.gz"
      sha256 "b1a3ae3a471dfd6f1a29a81cc814f2413c5f47efbcf7644c647f3c8ed8c7d300"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.29.0/popcraft-0.29.0-linux-arm64.tar.gz"
      sha256 "303a864f66c65a618448e16723815dc25db08da5418f1161378ba92d9a00c2f3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.29.0/popcraft-0.29.0-linux-x64.tar.gz"
      sha256 "4338ac8341d17a88768d1488975dc0f5753752d72cbea8cef3310a45dc7aa859"
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
