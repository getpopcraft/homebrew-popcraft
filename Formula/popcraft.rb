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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.7/popcraft-0.42.7-darwin-arm64.tar.gz"
      sha256 "03a4e875640a5298c33c26c58c43a12a0efbc11eed52c4f4c9c97ff61880ddf3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.7/popcraft-0.42.7-darwin-x64.tar.gz"
      sha256 "56ed7a486007ebf3c52e2eaeb5b111dfab12e0fa44570d62f5e76bb7381234d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.7/popcraft-0.42.7-linux-arm64.tar.gz"
      sha256 "c3bf415488fc49b3353ee6a6f68b36a03452e77f16c7e6afc87733f11a4d86f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.7/popcraft-0.42.7-linux-x64.tar.gz"
      sha256 "2ff3ec34ab3e76db2c2691b31aa5559bc3686b292aaaaca67870e3aaf37676db"
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
