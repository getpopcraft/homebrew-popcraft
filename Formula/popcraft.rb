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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.1/popcraft-0.62.1-darwin-arm64.tar.gz"
      sha256 "e83814c788632998fd0736a80d44ba30a1a779f94ea0760d3883791f9307839c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.1/popcraft-0.62.1-darwin-x64.tar.gz"
      sha256 "9964c103ba978d20e64adbfe85d1dcd833fbf5676aa6b597409d96f1e7aa02d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.1/popcraft-0.62.1-linux-arm64.tar.gz"
      sha256 "56e38723c1b2999eb3fd0b22b07515bed019956e2794113cbf8d2d9da3f57c61"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.1/popcraft-0.62.1-linux-x64.tar.gz"
      sha256 "e3469b63e71be9bdedfd52b45ac28ae4629d159851fe5249c2a28a15f286c01c"
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
