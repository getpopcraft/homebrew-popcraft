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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.2/popcraft-1.2.2-darwin-arm64.tar.gz"
      sha256 "400d93d74690cad747323efd610872d3c5a41d026262cdfb7b786b30588359c5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.2/popcraft-1.2.2-darwin-x64.tar.gz"
      sha256 "ab7693957f780b52074be42abd18a5d598f8846b49055f484a6d0218dee79d4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.2/popcraft-1.2.2-linux-arm64.tar.gz"
      sha256 "35b00bd2a77f054346d9910730dd0c5fd07cbf69ca26070ca4f457918ca40cb3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.2/popcraft-1.2.2-linux-x64.tar.gz"
      sha256 "a08b2f29a8bdb0c4c35fff09a00506898caaf0e154d29e7e2d44e6cf44033956"
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
