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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.0/popcraft-0.56.0-darwin-arm64.tar.gz"
      sha256 "8bbdac25d7c5519c2f5d0cfa736501a0a98ae01abc025ebaa1d251681ac473a6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.0/popcraft-0.56.0-darwin-x64.tar.gz"
      sha256 "ed4d958f151c3637390d5efb0c4bee609246d4026cffd71271ba7cdff17eb8c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.0/popcraft-0.56.0-linux-arm64.tar.gz"
      sha256 "54ff79e4a620ba0ab5c552eae6b4590f580d46d24897ed2ac0d0d6f8cfd718da"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.0/popcraft-0.56.0-linux-x64.tar.gz"
      sha256 "3735860576ca3bf2d22b527f37a4b40869e16b2b3b84fb37c9bc3fa1f2792940"
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
