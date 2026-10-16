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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.0/popcraft-0.43.0-darwin-arm64.tar.gz"
      sha256 "6f1e113566d8bb7ff199c30e4ec202d5683b577b3b2314fe40d60d862bfb7f7b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.0/popcraft-0.43.0-darwin-x64.tar.gz"
      sha256 "c5ca51e1db94511bfeafa54eae49fdd81cbd4a3b47d6a2632982fc03804e8200"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.0/popcraft-0.43.0-linux-arm64.tar.gz"
      sha256 "370169840392e200b01fe72a796730725c349cdc07704950a7a7ff419f6495c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.0/popcraft-0.43.0-linux-x64.tar.gz"
      sha256 "a0d58b45834c6a996730a3f5fd175868e8a1b14a84245351d9d516708577ff9a"
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
