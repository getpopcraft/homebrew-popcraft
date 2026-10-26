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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.11/popcraft-0.53.11-darwin-arm64.tar.gz"
      sha256 "7e78c3c5c4040cd0066be4d1ee2cfd6dc7f876e274612340f55924390ddad5f8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.11/popcraft-0.53.11-darwin-x64.tar.gz"
      sha256 "e58f843bb2ddf224f32e2c4ca07a1a7c26630f844f1ab87f6bafb4870f691245"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.11/popcraft-0.53.11-linux-arm64.tar.gz"
      sha256 "d4eb72466db6705006895efa878e4b8db110ee54a5040a872b0b9e2b12d811c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.11/popcraft-0.53.11-linux-x64.tar.gz"
      sha256 "64311d23e7b895f0ca71c87391674b67d7c06d751db7f44eaebd9a4a721093da"
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
