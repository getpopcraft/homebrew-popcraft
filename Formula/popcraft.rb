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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.7/popcraft-0.9.7-darwin-arm64.tar.gz"
      sha256 "493b32838e794831ce7e8032aaac30e1b6f8d45de35019bb8d6f5921c68eba5e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.7/popcraft-0.9.7-darwin-x64.tar.gz"
      sha256 "da6b3e18a55a415b015109c977b46c0c4f75bddea34f1f90926a29c6ed9179f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.7/popcraft-0.9.7-linux-arm64.tar.gz"
      sha256 "807f22d57006cdb4df02f14f1810883dee39e1a842ee42ff51b34b64f0eac3d1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.7/popcraft-0.9.7-linux-x64.tar.gz"
      sha256 "23daec5506e7f04f15c93c8daf4852d0b3604286281e679c9df0eff841d13d07"
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
