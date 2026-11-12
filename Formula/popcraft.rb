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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.1/popcraft-1.6.1-darwin-arm64.tar.gz"
      sha256 "e265ff4e788e26e38f945de6f0b0003a280fccba2b588c89829d44ebfb35a695"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.1/popcraft-1.6.1-darwin-x64.tar.gz"
      sha256 "72b7c93dd9be6173921a662eb9ae7c8940234b95e75e6ae17ab2b7addc7f0401"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.1/popcraft-1.6.1-linux-arm64.tar.gz"
      sha256 "5eb0734c0465615853be766722dc5ad7bf2c5bdb2dc56db0928f4eac136dbde3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.1/popcraft-1.6.1-linux-x64.tar.gz"
      sha256 "452a1e920d66091d8235af88ac4c4c0d76d346e4faaaa7b4bd2dc71e8707151f"
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
