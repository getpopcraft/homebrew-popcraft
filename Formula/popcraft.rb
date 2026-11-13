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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.0/popcraft-2.0.0-darwin-arm64.tar.gz"
      sha256 "03432165293a150333db3e998650bc8a4b9fe28f3f7d8eca6f8264d914dd7737"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.0/popcraft-2.0.0-darwin-x64.tar.gz"
      sha256 "a977b43e04e1fa3196c59f901f49b047b045201b49e935ac11debeedf7cb151e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.0/popcraft-2.0.0-linux-arm64.tar.gz"
      sha256 "70d0eb6c53d31b4b36b1f66eff71bcc095a05ee24ce55c0f5b170e8485036046"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.0.0/popcraft-2.0.0-linux-x64.tar.gz"
      sha256 "d45a349069a2a2ab930866988b7af9cf283840b3aa627f3f0560954f7db62611"
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
