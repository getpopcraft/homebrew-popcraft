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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.7/popcraft-0.53.7-darwin-arm64.tar.gz"
      sha256 "ce94ebe8bf1b2dd8f5be67a61cd550579237738baf1f524617aa5926184bb1fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.7/popcraft-0.53.7-darwin-x64.tar.gz"
      sha256 "226f003cf403b30ba5578c5571345b482aa0b0c217b4a5fb8a9dc270657fc874"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.7/popcraft-0.53.7-linux-arm64.tar.gz"
      sha256 "6e17483f5cb961ce2c581eca25380b3d3d17565e3a69c00440040cb08d2d2c91"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.7/popcraft-0.53.7-linux-x64.tar.gz"
      sha256 "c012be7815f3dc03da9bcb3ffc183bfcf0fadc59b0898bce6088d1b8ac24fdfc"
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
