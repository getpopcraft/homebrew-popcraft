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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.0/popcraft-0.38.0-darwin-arm64.tar.gz"
      sha256 "264eca35a66b80299f0db3b3a251aaaaf1c8c50f234900ae628002a6aab60aa6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.0/popcraft-0.38.0-darwin-x64.tar.gz"
      sha256 "8304f4db0ee50446ff00fadb2cfffe1bfa49b873b7895a25e2bf1b424c0acaa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.0/popcraft-0.38.0-linux-arm64.tar.gz"
      sha256 "33d8bed44454a6ea31207aa097a1da6e2c4c0d815530bb46c91f94fd5dea4410"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.0/popcraft-0.38.0-linux-x64.tar.gz"
      sha256 "27838de088e28caafbed9073c64c0f13b2c6e4755caa5d1a76022f09bb627d56"
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
