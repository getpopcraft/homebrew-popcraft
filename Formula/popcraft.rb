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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.14/popcraft-0.53.14-darwin-arm64.tar.gz"
      sha256 "d961f8ed4f00ac32517cee0dfe4d83445dc5a3e6ce615b57b1705128bf741fb1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.14/popcraft-0.53.14-darwin-x64.tar.gz"
      sha256 "36e289986e1908e83acb715651c3c75a5df985d3e0c4fcb2d0a90cb42fac1bc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.14/popcraft-0.53.14-linux-arm64.tar.gz"
      sha256 "7a6f8cbc36125b084eb1e8f12aa998ab491a3359b25d2f3b28630914a40e3593"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.14/popcraft-0.53.14-linux-x64.tar.gz"
      sha256 "8853fa601d6823c69b194d60741ca38ef3ef4d2968ca9309a86480ea63bd4a38"
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
