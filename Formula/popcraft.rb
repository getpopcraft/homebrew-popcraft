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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.36.0/popcraft-0.36.0-darwin-arm64.tar.gz"
      sha256 "6507654ab70156f72965a083b97977b4948420aed5a38f58d49f256d3850bf23"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.36.0/popcraft-0.36.0-darwin-x64.tar.gz"
      sha256 "7d63edb111a8a065e63c5115ae11ef4fd60b2b2beb6baa3af80e818a55e4c91f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.36.0/popcraft-0.36.0-linux-arm64.tar.gz"
      sha256 "c263a2785862e984f127a6f9297dd165b56a324b1754ca2143dfd93933f8ea2e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.36.0/popcraft-0.36.0-linux-x64.tar.gz"
      sha256 "e59d7e2401c9a4af93c64240d539e061b0edd3835013645818d532190d6948a7"
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
