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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.11/popcraft-0.61.11-darwin-arm64.tar.gz"
      sha256 "8d92e12b110de55d0af43e8497dfb874976131f8bcdcf52538ece29d9473027f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.11/popcraft-0.61.11-darwin-x64.tar.gz"
      sha256 "1d7599f4537c0c8729aabb5b89cfbe86f66c64d9046dc6b73755b47d8abe0a0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.11/popcraft-0.61.11-linux-arm64.tar.gz"
      sha256 "bd8ee1bccabbad653ab562af8763d76daff7a44f5bed8aa66c034e88bb5bb9b6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.11/popcraft-0.61.11-linux-x64.tar.gz"
      sha256 "4745abbfe2924cf8fe6215091a3989207d97029a530bbf7579dcc707ad435377"
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
