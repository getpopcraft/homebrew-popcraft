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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.2/popcraft-0.8.2-darwin-arm64.tar.gz"
      sha256 "1afb7a568b95da256acc3647cb5a7e42b3c80ef17394d6654a3f1ac55aa82fbe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.2/popcraft-0.8.2-darwin-x64.tar.gz"
      sha256 "f1222ceec12c2269bb4b163bdf34f42769dcab28e64d310ea73318a0f838602c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.2/popcraft-0.8.2-linux-arm64.tar.gz"
      sha256 "69d685cc170ab4c11ca40720ff82b83056b67e29a9b0d8be08c8fdca27a599da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.2/popcraft-0.8.2-linux-x64.tar.gz"
      sha256 "e613e7d8ecd59e95a8955092d96b8cfabce382c9a8b13f29a172455e66856a70"
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
