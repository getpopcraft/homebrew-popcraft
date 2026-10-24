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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.6/popcraft-0.53.6-darwin-arm64.tar.gz"
      sha256 "f35d671979b11c686cfbfca4e6fa064502f15f94474fecee188b698858dc0c5b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.6/popcraft-0.53.6-darwin-x64.tar.gz"
      sha256 "62a930e4eef998605ddea502a0ffa53f1be0b01a36f4f9ddee80210b62e6942b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.6/popcraft-0.53.6-linux-arm64.tar.gz"
      sha256 "abaec658c8f8c140c12d3a39ed08706b1cd71ca1369a75fe0b7929d6accdb343"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.6/popcraft-0.53.6-linux-x64.tar.gz"
      sha256 "ae1c030956f06eda0de70a0a07bf54cac79dbfd3e76c633afb83dc99f9c8d014"
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
