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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.6/popcraft-0.9.6-darwin-arm64.tar.gz"
      sha256 "af8220a936b9894f4aa0c7f85bdadd9258b2d20b9269c309f35a2df39edb4656"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.6/popcraft-0.9.6-darwin-x64.tar.gz"
      sha256 "e228f5ae5a885c71399761aac6cb21058f210ea3647b753321472dcd892eb3ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.6/popcraft-0.9.6-linux-arm64.tar.gz"
      sha256 "bc0b10caa2bb92814c05f37d15a5efde52542ff31f019a6f315c196fb34f6017"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.6/popcraft-0.9.6-linux-x64.tar.gz"
      sha256 "c40fc977eb7ba9dc2893cbe69f3ca9ca08eb1fb0940f775e222ad47a0f162db1"
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
