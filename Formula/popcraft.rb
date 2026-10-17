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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.1/popcraft-0.48.1-darwin-arm64.tar.gz"
      sha256 "ab721cbb36bf032427c10817ed2acb211d8880b2b7e4936228cfd0db811c574f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.1/popcraft-0.48.1-darwin-x64.tar.gz"
      sha256 "ab7d9fd259260e1fc0e5bf3c2db82ffadf68de04e60658e9d8a49431f974ab0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.1/popcraft-0.48.1-linux-arm64.tar.gz"
      sha256 "2b489b9fddbbc447c7ee6504ff5f846ccc7d4161b00093d28a1a26d6e5eab2a4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.1/popcraft-0.48.1-linux-x64.tar.gz"
      sha256 "cbf40f9fac29d676733d1f7abdeda8a179ee9e6c8a4a1bcba7f3eea712fd5d48"
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
