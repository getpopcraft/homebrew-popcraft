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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.18/popcraft-0.53.18-darwin-arm64.tar.gz"
      sha256 "3acbed8becca0bceee5333d150607ceed30926ed09b8eb083239dca1553d1e7e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.18/popcraft-0.53.18-darwin-x64.tar.gz"
      sha256 "9c03fea829c69f022b2ae77b2be485b809fb8ac8e37c74a097e51a2ddd123f71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.18/popcraft-0.53.18-linux-arm64.tar.gz"
      sha256 "7fff6bddd2a72e194f5415a0d70ae591189aa9ba000fdff64d6f61638827e136"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.18/popcraft-0.53.18-linux-x64.tar.gz"
      sha256 "ef7e08cb61fae5feac23fd7fad7c35b5f8966ad172499d003e9311682e117cbc"
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
