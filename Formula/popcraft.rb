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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.1/popcraft-0.61.1-darwin-arm64.tar.gz"
      sha256 "ca609b50102d1398079203d6e86f384f115b01fabf4a5911b45919502a1a0023"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.1/popcraft-0.61.1-darwin-x64.tar.gz"
      sha256 "232fd364b926987d11179c51cb1462a2f925f0b826c6e46945e32a66389745ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.1/popcraft-0.61.1-linux-arm64.tar.gz"
      sha256 "2a6aa1f82b5526347ae411cd36df1d605895fcec384e822f5f4bd69799f857de"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.1/popcraft-0.61.1-linux-x64.tar.gz"
      sha256 "51a06ad6c27afbdf527b07cbedc91329a29d64a9d7df85a9be2f92c35d01f75c"
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
