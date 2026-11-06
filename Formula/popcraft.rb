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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.4/popcraft-0.61.4-darwin-arm64.tar.gz"
      sha256 "649d30fd56bd6b0c80fd1677b158f3cd39a18fc40eb515e280b3a1916c15c83c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.4/popcraft-0.61.4-darwin-x64.tar.gz"
      sha256 "d346772169a3bda7ac6d9f955757a9972fe1e078b4e7b108b3fa5958496b515e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.4/popcraft-0.61.4-linux-arm64.tar.gz"
      sha256 "ae149d3c80f882d230582249ef5f367dc06726206a10eef896309037d76b1e37"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.4/popcraft-0.61.4-linux-x64.tar.gz"
      sha256 "e0dc6e155e9bace91d0b61da023b1766ec35640db8d27bd89b8afb33fab0ba94"
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
