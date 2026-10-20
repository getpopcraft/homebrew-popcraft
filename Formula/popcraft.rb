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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.51.0/popcraft-0.51.0-darwin-arm64.tar.gz"
      sha256 "187ca9f5eda7f4942b6de7655c086ad1fff906c1762f4ffbe00ac335eed0b8e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.51.0/popcraft-0.51.0-darwin-x64.tar.gz"
      sha256 "2e70294ca5293e949ab3a4e279e573dac1a1a7e1c6fd9f872d2106ed1b8b06fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.51.0/popcraft-0.51.0-linux-arm64.tar.gz"
      sha256 "49cd9b70a40f4d4bf4c9d4985de3b06c418ac3f7e1736d8c51450beb5fe11fa4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.51.0/popcraft-0.51.0-linux-x64.tar.gz"
      sha256 "3408a70d0859ac6f20b5e219eac351d3d422692c73319077999bec26164a9a4b"
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
