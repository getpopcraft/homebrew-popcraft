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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.4/popcraft-0.56.4-darwin-arm64.tar.gz"
      sha256 "e10f1216d58e470bea0e2265ac356b49f1ac1d950ad3f362fd479142e8b3ea20"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.4/popcraft-0.56.4-darwin-x64.tar.gz"
      sha256 "dae35d0a0389a1db7ecc2964a1ccceec5dc1cef11756fb99cdec82f1ecc51a39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.4/popcraft-0.56.4-linux-arm64.tar.gz"
      sha256 "d50d93fdb0796ce193800ac23d1a62557e4aef102344053c67b227b4e85654c6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.4/popcraft-0.56.4-linux-x64.tar.gz"
      sha256 "4ad619dd82280c67c29ef5cc859487025c84745475a8fbe31134fd44dc99153c"
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
