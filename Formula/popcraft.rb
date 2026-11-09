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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.9/popcraft-0.61.9-darwin-arm64.tar.gz"
      sha256 "dfdd91d2f76d701a7fd1b40ab3418f7ca2b0ea0961bd42a7f81a7f0f5886ab46"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.9/popcraft-0.61.9-darwin-x64.tar.gz"
      sha256 "d2ca7585605c89883092dd6e7c11a3a49910f349e2e16104e19cdda886e08d17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.9/popcraft-0.61.9-linux-arm64.tar.gz"
      sha256 "a553007a05016c969807880a57104bcc6026e2956b0282b8027593b4ed807b9f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.9/popcraft-0.61.9-linux-x64.tar.gz"
      sha256 "36aa93ee30a7c43c0fda5def4337bccf3a7da44edbc10f0970f1f0c48eaa5a32"
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
