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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.1/popcraft-0.63.1-darwin-arm64.tar.gz"
      sha256 "73b0b08636f1bc1a36a518c5de0d7503ef6006c98f10c24afe6821ad63f844b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.1/popcraft-0.63.1-darwin-x64.tar.gz"
      sha256 "8c7dc889555c3a985103e39c84041bc3d06a42d7ed6386add4dbcf146bf46a7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.1/popcraft-0.63.1-linux-arm64.tar.gz"
      sha256 "ed8a38901c40a270451a6163ffc2dd019a7d1d00bec6c228c56b1ee280776ca3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.1/popcraft-0.63.1-linux-x64.tar.gz"
      sha256 "86618a4d6947859a3c27ca68dddbef59dfe7984574c4a870a979a961a356e6b0"
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
