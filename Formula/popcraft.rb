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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.4/popcraft-0.53.4-darwin-arm64.tar.gz"
      sha256 "67ca3ca26ace97aa52d8532631ee66dbe8f0986855abca9d013bda218bb0610c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.4/popcraft-0.53.4-darwin-x64.tar.gz"
      sha256 "5f854166faf60f89b317927b98f78e7056fb3957df9242e8c314247930fbb372"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.4/popcraft-0.53.4-linux-arm64.tar.gz"
      sha256 "2b035c90ac82c5d58e0284f669293ed08b964305b4a503bb1f395d17b3372f37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.4/popcraft-0.53.4-linux-x64.tar.gz"
      sha256 "c191af3b928ba6900c30474aac163bb10bf25d670f626ac1d615ef9b098c5a66"
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
