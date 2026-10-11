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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.3/popcraft-0.24.3-darwin-arm64.tar.gz"
      sha256 "93e2ab3876f5f38ab1ada5093e05b8d3638f7051697b817f37ad43e439dd7806"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.3/popcraft-0.24.3-darwin-x64.tar.gz"
      sha256 "39528b8408fbccff9b9bbe04e5ecfc08906a0c7d444d1d275cef7cebe03d677c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.3/popcraft-0.24.3-linux-arm64.tar.gz"
      sha256 "86908319f7b74596e347ef9df85fc13e623e7e6a73676c716c5c55adc0e9ffa4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.3/popcraft-0.24.3-linux-x64.tar.gz"
      sha256 "93ea22236e7f540892b541dc539282c22b955cced1e4fd321ee62a684b7a720e"
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
