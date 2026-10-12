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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.2/popcraft-0.35.2-darwin-arm64.tar.gz"
      sha256 "9302d2e39580da0a34c8dcbb75f0b02b953d2fedfda436f78d8ff52e74bb92dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.2/popcraft-0.35.2-darwin-x64.tar.gz"
      sha256 "ff428a18e82e2eb3e7bdab1398ef00c0ce180f6d4cacd38e7261f308dfc1c484"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.2/popcraft-0.35.2-linux-arm64.tar.gz"
      sha256 "91a9a9e753ed297c6aa54884bfbffd39cf3850f720b3fb5e3b37ade6932de9c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.2/popcraft-0.35.2-linux-x64.tar.gz"
      sha256 "8c000742c89df36925c8f7cee3aa513b1b086ffaa7423646bc7e25fe0d481e48"
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
