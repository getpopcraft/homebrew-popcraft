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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.2/popcraft-2.2.2-darwin-arm64.tar.gz"
      sha256 "811f82b4aee771f6e1cfae4685eb453e90d403461c3f375b79af0042aad72228"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.2/popcraft-2.2.2-darwin-x64.tar.gz"
      sha256 "4352ee6fea822013ee2b306a0514fed9b5e66d2506e95bb94406eacbcc8bcf1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.2/popcraft-2.2.2-linux-arm64.tar.gz"
      sha256 "145c2021b5170d2e7bffe0a45945e4d41ccf5252dd48375de6dcc001e8dd8005"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.2/popcraft-2.2.2-linux-x64.tar.gz"
      sha256 "3de329654deaab34dec28aa245d1b89b7e29d50a5e5d98eb8ac308215437ab4c"
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
