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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.2/popcraft-0.63.2-darwin-arm64.tar.gz"
      sha256 "a600adcdff3b1bc945f9f17b22b406f1da1bf08e70f49510327646a94a04478f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.2/popcraft-0.63.2-darwin-x64.tar.gz"
      sha256 "781d1302fe8ee37a471b464187a09e38391a76fe3cd000bf50e651da10712797"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.2/popcraft-0.63.2-linux-arm64.tar.gz"
      sha256 "15d3bbd0d1f9d4cdae743043367c9a4d21d8ebe7d7f6fa653e45422e04d014fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.2/popcraft-0.63.2-linux-x64.tar.gz"
      sha256 "fe92c27049ece479984835f71342377bf7aef3ac3ac4f1f2f8da05de4b8a0618"
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
