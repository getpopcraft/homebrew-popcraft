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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.0/popcraft-2.2.0-darwin-arm64.tar.gz"
      sha256 "d7975e8b4635f606baf118d7893afe51d996bb517ec955c5aaa4e33b27b05924"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.0/popcraft-2.2.0-darwin-x64.tar.gz"
      sha256 "928641e6025f0fdc38162dc9d72c3ae70b844be43b981fc8183dfddc4c5e8305"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.0/popcraft-2.2.0-linux-arm64.tar.gz"
      sha256 "f2811f571b2cb4a9d7a1d473dc3b53324a269f965c876e55255a3bce0690f7e9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.0/popcraft-2.2.0-linux-x64.tar.gz"
      sha256 "83fe32094f0aa2294b658ec7525d5dcd1f4ce714d80aec50d9648422633bab06"
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
