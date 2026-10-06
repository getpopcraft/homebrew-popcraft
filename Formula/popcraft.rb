# typed: false
# frozen_string_literal: true

# The `popcraft` command line: one executable with the design kit inside (compiled with bun), no Node needed.
# npm has the same CLI as @popcraft/cli. Written by .github/workflows/update-formulas.yml; don't edit by hand.
class Popcraft < Formula
  desc "Command-line for PopCraft: edit .popcraft files, call the API, publish plugins"
  homepage "https://popcraft.app/docs/api/cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.6.0/popcraft-0.6.0-darwin-arm64.tar.gz"
      sha256 "c2df9bd0c0458aac1a6cb5b11d707c4454ddef512b6b1e1be71e551ac9dc470d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.6.0/popcraft-0.6.0-darwin-x64.tar.gz"
      sha256 "58a2c1e80002ab82ff351dbdde02d0f53cfc1e2b671e0b7e75f7ae40768b347c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.6.0/popcraft-0.6.0-linux-arm64.tar.gz"
      sha256 "540fc178e39764b29de6abb302cd595a9745877e4d4e469e06c0943985f88f31"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.6.0/popcraft-0.6.0-linux-x64.tar.gz"
      sha256 "04cdac757f33f513b97ad165c124e47db5cf2f74e73cafa0aab1829640db4593"
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
