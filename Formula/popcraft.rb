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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.1/popcraft-0.42.1-darwin-arm64.tar.gz"
      sha256 "bb3b71cce7afc7fe3d539fd60b9b7a1bf1477d99713c8e3b8b25d619e5c72c56"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.1/popcraft-0.42.1-darwin-x64.tar.gz"
      sha256 "282f2d761201c0ceb75862534125792401a1b4133021042d75ca7788b5fbafcc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.1/popcraft-0.42.1-linux-arm64.tar.gz"
      sha256 "5dc2cc64ccbd98b01016146c0f2b1b2b0cd0f092403506b4db7ae0ece0c16acd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.1/popcraft-0.42.1-linux-x64.tar.gz"
      sha256 "57d7927a30aabb03eadb5ff2b7ab7e2dfebc441f0f3855751c6e2096f7a44e31"
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
