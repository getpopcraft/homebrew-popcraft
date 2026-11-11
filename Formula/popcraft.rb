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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.4.0/popcraft-1.4.0-darwin-arm64.tar.gz"
      sha256 "d96f2fbba8305158b5dc93052f650199ea764d8d5f843d15073f18a5a0d4a4ee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.4.0/popcraft-1.4.0-darwin-x64.tar.gz"
      sha256 "901c0de224e68c366157e3c7eb3a54d723f23be268c5e74b2b851e1cd0785cdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.4.0/popcraft-1.4.0-linux-arm64.tar.gz"
      sha256 "5db548655d6842f305b74e764f08b73da5c4fbf7753a6ece8a4c0563fc6f9252"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.4.0/popcraft-1.4.0-linux-x64.tar.gz"
      sha256 "66ffda8342ce8f3f1b07cae865697da6c31a1c27e16a918ca9893d08b973c1a8"
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
