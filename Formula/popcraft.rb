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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.7.1/popcraft-0.7.1-darwin-arm64.tar.gz"
      sha256 "d6045e05c2ee1629d17f0ff620851f761071cde13c0506d1ad75b962b9b8030b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.7.1/popcraft-0.7.1-darwin-x64.tar.gz"
      sha256 "0d3a0c4089f46c88577de545238f7273d1dc92d8c6fcdf8f15601d4855791009"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.7.1/popcraft-0.7.1-linux-arm64.tar.gz"
      sha256 "88e62e5f4d50851ae9b514677069ec13c69dfdfc4e5741e4a079ea0a5f413609"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.7.1/popcraft-0.7.1-linux-x64.tar.gz"
      sha256 "994c03af5a6a30f8c1764de772241a5bfdb46ea42113799cbaee1e6dec74c4ea"
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
