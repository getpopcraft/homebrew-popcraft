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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.0/popcraft-1.8.0-darwin-arm64.tar.gz"
      sha256 "3ddb9f69c04b81e154118dd973d88bea593868a089eb507238137b57cb98f294"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.0/popcraft-1.8.0-darwin-x64.tar.gz"
      sha256 "a877b2976ce28f1d936a57dceb2df172017e8b4355ef952ba4e4f86352a9ebed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.0/popcraft-1.8.0-linux-arm64.tar.gz"
      sha256 "e73b3bfdba2c539f7e1ba41002f2fc4f5eb8ddcb17b4384eb88fe4ff3dff1e8b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.0/popcraft-1.8.0-linux-x64.tar.gz"
      sha256 "342a6ebe8fec5326d6c981c062ef6bde77adedc6e1aa4b7c22ba9714c9788bb3"
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
