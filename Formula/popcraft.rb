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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.1/popcraft-0.53.1-darwin-arm64.tar.gz"
      sha256 "67e0a950071d533e5d29bba52917c336717adcbd95d9947b1dd3fdad8675aafc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.1/popcraft-0.53.1-darwin-x64.tar.gz"
      sha256 "f864daf4ad9fb7b3ad8ca2b3e0183f3ddf06e1df131571e30a1072ae6b841b23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.1/popcraft-0.53.1-linux-arm64.tar.gz"
      sha256 "177b7c32bd15c67bae2263f1478d8e0a5020321bf49e520569d4480e2b48dbef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.1/popcraft-0.53.1-linux-x64.tar.gz"
      sha256 "9446148694f6e3f4be16bd5ff3cad11a37db24acd2453a24e46228b1999fe9ab"
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
