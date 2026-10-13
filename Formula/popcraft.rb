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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.5/popcraft-0.40.5-darwin-arm64.tar.gz"
      sha256 "4067af7194c87dedfd25ac1ea39f1d4c5d7c4ee548f3d6d46cc1b881ecc3cc32"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.5/popcraft-0.40.5-darwin-x64.tar.gz"
      sha256 "fa3f12bcd4036039f2004a2939211575454465ff1e80c23c6b23a8f31deb9a72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.5/popcraft-0.40.5-linux-arm64.tar.gz"
      sha256 "531953cf2149669ad8b71c0e1e1a5bff9afa9173fbf949e7e046ddbc6bdb2950"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.5/popcraft-0.40.5-linux-x64.tar.gz"
      sha256 "0f39199b839af78a8ae1a15360ba4ebc6434297f650bfb16e2b1f0ecbb4f9afc"
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
