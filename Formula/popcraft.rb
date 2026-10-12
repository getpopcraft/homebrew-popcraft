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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.1/popcraft-0.39.1-darwin-arm64.tar.gz"
      sha256 "6b2a5aace8acdca500898f6e61f408c37bcb753356715c89a09cca24de3bfd49"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.1/popcraft-0.39.1-darwin-x64.tar.gz"
      sha256 "3645790ec6520901f5cd8859189d3237b72f83b51b725e459bfdaa8b826aa116"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.1/popcraft-0.39.1-linux-arm64.tar.gz"
      sha256 "3389be5521dfed4b0f982bffe588643a943ee472a11ff434b1341011f44cc3b4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.1/popcraft-0.39.1-linux-x64.tar.gz"
      sha256 "8e134a69322dd07134319b02c2c75403c65f31306da3b3aec34039e42b9e21c2"
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
