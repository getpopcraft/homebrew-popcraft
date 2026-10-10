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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.3/popcraft-0.20.3-darwin-arm64.tar.gz"
      sha256 "931047beb5e7ce969ce69cbec50ae9d5e5eb4d49bbadc1641f391f5e65f2202f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.3/popcraft-0.20.3-darwin-x64.tar.gz"
      sha256 "c6b2216b09102b19abb6a5bb9162e7a3702f3e4a61d0d94f3e5216490a933664"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.3/popcraft-0.20.3-linux-arm64.tar.gz"
      sha256 "bb9dd0bb24490d6fdabbe621a654670625cb278d0e606a4441b42963bb3362d6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.3/popcraft-0.20.3-linux-x64.tar.gz"
      sha256 "388eb1c33f1fe21bc14e290b49f7bdc31d7e21ac6765a48dd618a533302f56a2"
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
