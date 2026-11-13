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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.1/popcraft-2.0.1-darwin-arm64.tar.gz"
      sha256 "5b8bbaec8aa217b9a29f16d99f6fb21c3c7fb24a197c3961d750f139b1abe492"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.1/popcraft-2.0.1-darwin-x64.tar.gz"
      sha256 "08a598924861ff4b43f3a8e2a4144aa3afe6f1ddf37ef744dccda1fb51df57c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.1/popcraft-2.0.1-linux-arm64.tar.gz"
      sha256 "fe18ef0f98d2dcd22031fff4c0590cf1653b690dd28662a383042ba909cbeec4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.1/popcraft-2.0.1-linux-x64.tar.gz"
      sha256 "d6fc136e1d88148a255b466b474e87a9e342f40616866b60ee2aeb0b425c9e2b"
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
