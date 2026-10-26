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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.13/popcraft-0.53.13-darwin-arm64.tar.gz"
      sha256 "4a278edf71f86970724292d70d291755b34e19bd7172bb0469642da2cdc0fdeb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.13/popcraft-0.53.13-darwin-x64.tar.gz"
      sha256 "e751303c70be6987fd37d6b8008c5ad8212e2519db1e23b0ecae16228359e3e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.13/popcraft-0.53.13-linux-arm64.tar.gz"
      sha256 "77b71223d53b9d72e4a1d4d948fdd419bb0d55d0d9e8f5c276228d664444eae9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.13/popcraft-0.53.13-linux-x64.tar.gz"
      sha256 "976f6d3588b43841bb661d1a8c1e5f5e8933dac17d156ab1188cd540b6d3b6eb"
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
