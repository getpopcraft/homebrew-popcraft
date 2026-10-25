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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.9/popcraft-0.53.9-darwin-arm64.tar.gz"
      sha256 "72789845bc8b5986fe3309f534ce3d17c1908aaca71dbe23639c840c33f28db3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.9/popcraft-0.53.9-darwin-x64.tar.gz"
      sha256 "ee71cf8a5f9f9d5b0b16d57170bb21c8cc90ccf771ef9b4dfde35f0c3bd59f0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.9/popcraft-0.53.9-linux-arm64.tar.gz"
      sha256 "dbf3b7a17e2a485ea66a125ebec6b718c2baacb6006b9f8ab5d64cef3014a339"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.9/popcraft-0.53.9-linux-x64.tar.gz"
      sha256 "e230d1d60fe7b362133bfc2edabaf31470f0e056842c78dbb4b191c69a949da1"
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
