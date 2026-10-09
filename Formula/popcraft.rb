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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.15.0/popcraft-0.15.0-darwin-arm64.tar.gz"
      sha256 "ddf5290b05d78efdc154caea393785a808626b2eb3990b6ecdfbd9a94f3d3f22"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.15.0/popcraft-0.15.0-darwin-x64.tar.gz"
      sha256 "0992c5fe88aa0a361237f350db27927a7311c0ed17f98312b20136c2fa9e80d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.15.0/popcraft-0.15.0-linux-arm64.tar.gz"
      sha256 "58c1a99f226610b76510f15dedd037e0de0351ce9f3e6d501d81a949c307b451"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.15.0/popcraft-0.15.0-linux-x64.tar.gz"
      sha256 "72a77c73a9ed907acd0d85aa26afb7cb25ac814f1558bfa5f57b1e3ad1b78000"
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
