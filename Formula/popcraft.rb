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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.5/popcraft-0.61.5-darwin-arm64.tar.gz"
      sha256 "a0e4ee0b778bc93996b285a3ef6e81b2952f1a63d427bc35812cdb1b3f049c8c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.5/popcraft-0.61.5-darwin-x64.tar.gz"
      sha256 "bc1aaa0bb5d48ee02e2feee86279b4e97d7043c0165a601f1d91b4c13f9ad8fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.5/popcraft-0.61.5-linux-arm64.tar.gz"
      sha256 "76943c741e4a8732d296fd83a806e4c3e9dffcb79746a4f8066d3a0d4a808e57"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.5/popcraft-0.61.5-linux-x64.tar.gz"
      sha256 "7ba046c206f858ff0bb69df8d99b2c4618dfcf555250164bdd85b3f297a41115"
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
