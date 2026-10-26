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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.10/popcraft-0.53.10-darwin-arm64.tar.gz"
      sha256 "1a2c01f800f61b0da34edb312a036abc8caa3906717f08a9e6ab6a15e50ee064"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.10/popcraft-0.53.10-darwin-x64.tar.gz"
      sha256 "961ddaaf4bdd5e1c9d66e327e2c845e8d0deb3b91b308697cefc9da205789f92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.10/popcraft-0.53.10-linux-arm64.tar.gz"
      sha256 "9ff56f0b6ab1f728ca44d920f9f18b7dd062fecde47767027418c05ceb2dc4c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.10/popcraft-0.53.10-linux-x64.tar.gz"
      sha256 "eff45af4e248d3286e24f087b10f6b67fabdae6f2720f2d0e37ac1168f9d822c"
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
