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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.1/popcraft-0.34.1-darwin-arm64.tar.gz"
      sha256 "ae890f85490ff4ce194d83ed5fe540b31604202929acf09cac425a5b22c99a38"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.1/popcraft-0.34.1-darwin-x64.tar.gz"
      sha256 "591f88e9fb36dde310486ca84cf9337190edf190b6ee9450efa62a3be74a9cff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.1/popcraft-0.34.1-linux-arm64.tar.gz"
      sha256 "225686ee284725369d55e2a0d9a763a981cd46d13b417cca49edb808e6384596"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.1/popcraft-0.34.1-linux-x64.tar.gz"
      sha256 "52e688e87d9bfc8e25d24132dd5ad5e996e23e1638aee62bdc88cf2ecf5f4a51"
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
