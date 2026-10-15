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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.4/popcraft-0.42.4-darwin-arm64.tar.gz"
      sha256 "76bea4de29e0687f1b26409eed4c7402cfc8bef1733b65270386513046d61649"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.4/popcraft-0.42.4-darwin-x64.tar.gz"
      sha256 "39acc35bc9257c5c38b6cdb325904ee1d7260a38dd76ab57ed0d8230f009f9c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.4/popcraft-0.42.4-linux-arm64.tar.gz"
      sha256 "dbac32b549af8bbaf9b7e0fcdd788836072c7ce3cbe9a20bb7193eedcb54d3ad"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.4/popcraft-0.42.4-linux-x64.tar.gz"
      sha256 "942d75f097a08bcc06a88537a63e0e7f7833bd469a390bd259e5ee5c58fba081"
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
