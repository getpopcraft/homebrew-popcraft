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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.1/popcraft-0.24.1-darwin-arm64.tar.gz"
      sha256 "147969c55d49c5cd55aa6b7c202e0ba38c0360da9aa9c12237fc4e240ab6551a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.1/popcraft-0.24.1-darwin-x64.tar.gz"
      sha256 "9c6d754dc01b98c09f328d81c9b2f16e5f1ac5e1eb087d6d5ec35278f748ea4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.1/popcraft-0.24.1-linux-arm64.tar.gz"
      sha256 "130509c845e32eab32bfbcfa4ec1ac66b5a2e8c129ae37ab2908dc95bf49f79a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.1/popcraft-0.24.1-linux-x64.tar.gz"
      sha256 "3dc5964efa1956e017320b10e6143a2c636fee459046743c4d0f94a78ed09eb1"
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
