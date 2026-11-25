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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.1/popcraft-2.2.1-darwin-arm64.tar.gz"
      sha256 "28b0b34b66a50ffbf6e273b787d5c5f4eb0a8c15961eb1bfb004359912aafae3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.1/popcraft-2.2.1-darwin-x64.tar.gz"
      sha256 "7ef0e1b9d382406d01a10891490ba65f28bb80b2d41e3e0445b47f74579dbd95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.1/popcraft-2.2.1-linux-arm64.tar.gz"
      sha256 "6b4724019a1bf752711fc7aebd351e0078907c4ffce07bcc5d7a8dc05c354a00"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.1/popcraft-2.2.1-linux-x64.tar.gz"
      sha256 "533447c46abab266679d82cd8f6412f70a52d6262b3cc4ae3aa3636d3ea8e8a3"
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
