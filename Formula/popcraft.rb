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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.1/popcraft-1.5.1-darwin-arm64.tar.gz"
      sha256 "4b0f7398966407f7dfefa7acddcafb763a51605f46c8bd327e62880e2ef9ae43"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.1/popcraft-1.5.1-darwin-x64.tar.gz"
      sha256 "dc0301f9a46220a8395c237cb4d041edb51b466ef1205e681a9ecdc5dd48d60c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.1/popcraft-1.5.1-linux-arm64.tar.gz"
      sha256 "d9aaf2525e88d706df9988a2c5adca8c268977ba47d09c88a19dbb2fff8a5c64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.1/popcraft-1.5.1-linux-x64.tar.gz"
      sha256 "d61214f9171b5653088c5fb260d62f0785fc4b00b593de4eedf626ae3de82762"
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
