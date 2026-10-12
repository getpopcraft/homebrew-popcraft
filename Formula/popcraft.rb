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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.7/popcraft-0.38.7-darwin-arm64.tar.gz"
      sha256 "3943f4b13305510301b5d6edf4043802516b18f68d492714d8b96a67e14922a6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.7/popcraft-0.38.7-darwin-x64.tar.gz"
      sha256 "bff9e20d463616c19fb85d625b973c27c1042a87821e75e887e9cac7ba8abe0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.7/popcraft-0.38.7-linux-arm64.tar.gz"
      sha256 "010e8bdebf2a33d0a413f1983c3cb94ce6e73824e8ccec6ce7b578fe0cf394c0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.7/popcraft-0.38.7-linux-x64.tar.gz"
      sha256 "37d9940d02d2213e7767d0fc9a04696062a8f931d81ba3b3d81b30d6ea9b17f8"
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
