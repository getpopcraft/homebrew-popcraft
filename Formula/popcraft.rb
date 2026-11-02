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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.2/popcraft-0.57.2-darwin-arm64.tar.gz"
      sha256 "d0e4971393f8639c965675296d5fddc1e177c5ef6c205335bb9a05e8bbf71516"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.2/popcraft-0.57.2-darwin-x64.tar.gz"
      sha256 "ab7a14e12a0fdc9bc94f47fe52b7f2454a1cdc1ac2553c4bde045f964460c037"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.2/popcraft-0.57.2-linux-arm64.tar.gz"
      sha256 "98ef169f2e8620f6bf8be2d803446d70b774a9b1dd24dbcd0f9fa129b1c19579"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.2/popcraft-0.57.2-linux-x64.tar.gz"
      sha256 "e6ff944c7b847349bae29117daa9eaf248cb7ced327b3bbc5f54290614e776f4"
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
