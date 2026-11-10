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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.3/popcraft-0.63.3-darwin-arm64.tar.gz"
      sha256 "58a98e402831767e5c026b4adb8693d9f8440d54c8a13c74d4c935fd7ce52843"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.3/popcraft-0.63.3-darwin-x64.tar.gz"
      sha256 "56340344e8cc40ea4d640f2777081911cdf1445d62c612085de586ccd654137d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.3/popcraft-0.63.3-linux-arm64.tar.gz"
      sha256 "a75a1d0636b6758e138fcfaf83785b148ca556f350bdfcd106c0ec2a5dd14711"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.3/popcraft-0.63.3-linux-x64.tar.gz"
      sha256 "892b620e10b6739e55ff0713614fcb524156c6c718c401bb54a91c791ac737b6"
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
