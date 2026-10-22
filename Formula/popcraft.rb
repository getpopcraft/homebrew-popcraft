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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.2/popcraft-0.53.2-darwin-arm64.tar.gz"
      sha256 "2d3a2deff98b923e8be657d8cd22ad84493b3d8c8ff9f4abc7fa6263882328bb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.2/popcraft-0.53.2-darwin-x64.tar.gz"
      sha256 "c3b3ffcd1e542ede609b9d6044e48af89cef8332fa1f6c3b52c692b454a2c91f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.2/popcraft-0.53.2-linux-arm64.tar.gz"
      sha256 "6cc4877e308bb017ad666cc5084261ee7400d8d4200d04d9ae102f91636abce5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.2/popcraft-0.53.2-linux-x64.tar.gz"
      sha256 "2dda29f51fd7a88acd0b59b3496c284c257fb5686c1d080c3347a4048b600dfa"
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
