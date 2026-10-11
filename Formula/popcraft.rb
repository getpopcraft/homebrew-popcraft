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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.0/popcraft-0.32.0-darwin-arm64.tar.gz"
      sha256 "9f2874517abb0242f4a8ea41cb46554d2519389324e5ecbf63595a6ae5b3b26f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.0/popcraft-0.32.0-darwin-x64.tar.gz"
      sha256 "b282d051366936d12143bb6df52173b5657515e04da38d842782af5c8c6b00ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.0/popcraft-0.32.0-linux-arm64.tar.gz"
      sha256 "ea8678a37920322ae98fe76800b0cba6ed6a7e4b25a93901ae91a8a65889784e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.32.0/popcraft-0.32.0-linux-x64.tar.gz"
      sha256 "6ef6f133c69e3df0089ecc631987f75cebf36ecd47fac1db177cf120950317e8"
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
