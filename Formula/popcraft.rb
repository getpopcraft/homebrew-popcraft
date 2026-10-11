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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.1/popcraft-0.32.1-darwin-arm64.tar.gz"
      sha256 "06505b3a3fb075f87bdfa14f90b581ecbbce1f0d5664b550823c47443c169110"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.1/popcraft-0.32.1-darwin-x64.tar.gz"
      sha256 "00e61a5c5d9601e1781da6456868a539ff4d6a3efd7ccba57d3c0e31cb60220c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.1/popcraft-0.32.1-linux-arm64.tar.gz"
      sha256 "6affb1c003410ce7c15786750c1a3772a84bff97ea3d1ca0bca77e34907a48dd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.1/popcraft-0.32.1-linux-x64.tar.gz"
      sha256 "733fd17bba832cd053f967deaa1808bbd0e5bd10ed95eb9605861e1ab6ba7b3d"
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
