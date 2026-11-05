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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.4/popcraft-0.60.4-darwin-arm64.tar.gz"
      sha256 "d0fe4f4c2788f5fe7be7576a77ec89ba7fd47e3743b86b7bd22807ce3644825d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.4/popcraft-0.60.4-darwin-x64.tar.gz"
      sha256 "d954e6709a7f5b09378b167554c9ad4be9a1aa26d0db7abb0b159ef326165fa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.4/popcraft-0.60.4-linux-arm64.tar.gz"
      sha256 "2959dcbd28311b8f6a03b3f0d16c5249bfb11879fb5cf042b02089a1061cab7d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.4/popcraft-0.60.4-linux-x64.tar.gz"
      sha256 "386bcb48e8d92b8558251da07916cafcc97433b813aad63b2934c4cac5691acb"
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
