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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.1/popcraft-0.20.1-darwin-arm64.tar.gz"
      sha256 "06f34da66e7c0820d3f82f68c5c31ec0b18c63624cac190c355cbdbf1e241941"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.1/popcraft-0.20.1-darwin-x64.tar.gz"
      sha256 "a7efba0f7d5970e25490ad8f9baf0c42db6e8fd8cdd843ba6167a2d78ebe7e62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.1/popcraft-0.20.1-linux-arm64.tar.gz"
      sha256 "560be0dd5913ffd6ecba65d1d942a5185aeb7d501906da656d7cdbce8edfd221"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.1/popcraft-0.20.1-linux-x64.tar.gz"
      sha256 "4cb0d21658a0680827c5c4d11014972ba535eab610763fd2ed85fc003afd3b5d"
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
