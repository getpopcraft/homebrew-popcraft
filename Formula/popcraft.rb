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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.30.0/popcraft-0.30.0-darwin-arm64.tar.gz"
      sha256 "303a74977b784525244a9642aac0dd6e09c7cc1fea94672509854dfa91980b74"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.30.0/popcraft-0.30.0-darwin-x64.tar.gz"
      sha256 "a09f4d43d0ada4609ad625a7c89e612750c913fc60a675406bd68b17be1ae9a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.30.0/popcraft-0.30.0-linux-arm64.tar.gz"
      sha256 "518253808019e36bc3e98ee8f4c55640b0aa6bde946b5c0bb83e55fe1f5475ab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.30.0/popcraft-0.30.0-linux-x64.tar.gz"
      sha256 "e252cd6710cb4fb60eb679714c7d6a851853480e7ff488e1ae7afe94fd8921fb"
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
