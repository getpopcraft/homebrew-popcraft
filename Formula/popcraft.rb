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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.3/popcraft-0.61.3-darwin-arm64.tar.gz"
      sha256 "e166ba5e11bced953dd0e3773a5c0fb12464d21b90dcb337ef956393bb5006ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.3/popcraft-0.61.3-darwin-x64.tar.gz"
      sha256 "35d87134b499764c01a1dd887f157a3922d121856a9fbf8f4687c3f225bf59f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.3/popcraft-0.61.3-linux-arm64.tar.gz"
      sha256 "d9a1553b02da1e33f50c754dba9924898b4fa67e18b63b1f0e5e7bd70105bea2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.3/popcraft-0.61.3-linux-x64.tar.gz"
      sha256 "0c8a3aa7eff1511a9464b89623510836686525c8d0ed03005db8006a07c84a88"
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
