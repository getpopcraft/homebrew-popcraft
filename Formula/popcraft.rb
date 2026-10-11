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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.3/popcraft-0.34.3-darwin-arm64.tar.gz"
      sha256 "63e01eca8f9d976b71781296da21bcd7688eedcbc6734a38caee5562fd436827"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.3/popcraft-0.34.3-darwin-x64.tar.gz"
      sha256 "f7e964e0f543b854b64ac22b09f1b4b3e0740e022a0b9dbde2720d57360efa28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.3/popcraft-0.34.3-linux-arm64.tar.gz"
      sha256 "1ef8afd0c2a9a90669458492b01371193389d3025afe18c6e2fe1a7d4b0cd9d7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.3/popcraft-0.34.3-linux-x64.tar.gz"
      sha256 "eaadf4cb5272dc5cb3b6e00b6b80187dabe0f377cdf11a589222cc8eae9cefc8"
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
