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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.1/popcraft-0.57.1-darwin-arm64.tar.gz"
      sha256 "d1b1860e6c7ea50b90b784f4cf9d3e6743a5c20dab1c09240bb5e0b0b7e75a9a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.1/popcraft-0.57.1-darwin-x64.tar.gz"
      sha256 "c278caf565b1be164d1238ac733ab5bbcb375696db39192f63bd20f3cb093e12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.1/popcraft-0.57.1-linux-arm64.tar.gz"
      sha256 "58b15b7a98b0042ab87a4b06c4cb6922cfc9b7b890fadec1e083f0e3572387c8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.1/popcraft-0.57.1-linux-x64.tar.gz"
      sha256 "fe23afa1e01e230a6203b34d1f42b6b567ffb23a4da30583ead0f60322871ed5"
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
