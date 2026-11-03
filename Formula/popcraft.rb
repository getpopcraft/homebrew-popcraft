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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.0/popcraft-0.60.0-darwin-arm64.tar.gz"
      sha256 "dd07cff4ff8040317c2658f09ea8c20c367478b6f755ea79b9775b73c350e000"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.0/popcraft-0.60.0-darwin-x64.tar.gz"
      sha256 "28dea4e55aaf3c1810e2b071c814c74e7933a8fd0601b37dc46e413fee577004"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.0/popcraft-0.60.0-linux-arm64.tar.gz"
      sha256 "0c8b0884a0ef6a9de5ed7dc085ad27deeea4236dabb428295b2c8e3cbfcadd32"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.0/popcraft-0.60.0-linux-x64.tar.gz"
      sha256 "27b9265109d18a445bd2ab971ca5912efaf0a687278d25d028e4c2c1ed5a2cd3"
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
