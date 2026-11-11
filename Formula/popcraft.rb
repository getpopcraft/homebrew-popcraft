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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.64.0/popcraft-0.64.0-darwin-arm64.tar.gz"
      sha256 "c2d62e889ef7a7e1ed4bffd45738b759bc0d9a5cb8b56463b57426acf75449f3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.64.0/popcraft-0.64.0-darwin-x64.tar.gz"
      sha256 "64e1af0e161318413288dfdc8630e2b1dce34d70052144b8c92fc99e30bcff1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.64.0/popcraft-0.64.0-linux-arm64.tar.gz"
      sha256 "297ce63ff5e05eaaa7b01a047617146f78883dc080837cc16f801d5fe6ba6f7a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.64.0/popcraft-0.64.0-linux-x64.tar.gz"
      sha256 "9a9369dc85bf4be606338e8279222dcf6ad2cf46a265d9d8355e7fb6175b18b2"
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
