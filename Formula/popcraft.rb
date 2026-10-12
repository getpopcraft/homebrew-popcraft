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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.2/popcraft-0.38.2-darwin-arm64.tar.gz"
      sha256 "d6af1c3c73ec1204ccc129fd0f517f658c457d2b66e9299cda989ad808b91406"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.2/popcraft-0.38.2-darwin-x64.tar.gz"
      sha256 "56e95693a45a213b46b2d83acec75f34bf598745edc8250d06f15715f9a4f23b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.2/popcraft-0.38.2-linux-arm64.tar.gz"
      sha256 "e58d5acd006858316bf9b50f8184b6ac15481829b3744559cbb225dae61e8ea8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.2/popcraft-0.38.2-linux-x64.tar.gz"
      sha256 "a6feb3dfea6d263dd6678ad08e9267d69e01ed954549c960ae39822c0b9648bf"
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
