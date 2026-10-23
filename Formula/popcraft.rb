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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.5/popcraft-0.53.5-darwin-arm64.tar.gz"
      sha256 "3f356e7e4fb68118332b2745df0232b9e70bb03c207ecdfafca391c295bd6ad1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.5/popcraft-0.53.5-darwin-x64.tar.gz"
      sha256 "4a80a1cf07dd6c48737664383a55d4d2d9508b498760b3f69f57a8273db71bf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.5/popcraft-0.53.5-linux-arm64.tar.gz"
      sha256 "976260485c4cf39d5b1dccb7998974395de4c27d49c73070f78f59ae0831ea03"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.5/popcraft-0.53.5-linux-x64.tar.gz"
      sha256 "e50bc43aa024d9a6b37848e83433dba76eee40f6d0e9a2dc102809367b9adca9"
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
