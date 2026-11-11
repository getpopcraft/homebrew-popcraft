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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.1/popcraft-1.0.1-darwin-arm64.tar.gz"
      sha256 "c3cd6e43746fd1e906afe539f15d9479fbc9e862dd59c424693b06abd2071613"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.1/popcraft-1.0.1-darwin-x64.tar.gz"
      sha256 "5ac5f2928ba9f37ae881a076568c81c6e13c8cd1f109e841fa4c687800ad4b52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.1/popcraft-1.0.1-linux-arm64.tar.gz"
      sha256 "858f2a9bfe6297ab3242f9063622e5af5803eb5aea5ffedcb44696645c55bafd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.1/popcraft-1.0.1-linux-x64.tar.gz"
      sha256 "65da7fdd37943a08551e5c522537f8537e2921f1f065848751507e9812e9bcd7"
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
