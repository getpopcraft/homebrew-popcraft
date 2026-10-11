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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.1/popcraft-0.23.1-darwin-arm64.tar.gz"
      sha256 "ac6917905d23cbbfc6aaf5c3d7eb67058b8cd401fac793fbcc0191eaa165baeb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.1/popcraft-0.23.1-darwin-x64.tar.gz"
      sha256 "ed52580ca89dfa42a58a49f6fb8d4d2ee6b56a4080b8a9af60a5e24ac7d64ff7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.1/popcraft-0.23.1-linux-arm64.tar.gz"
      sha256 "6fc362a7b0799673ce9b833b4b28ce4acbc5d45916892221c41e9f3bdf0199a0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.1/popcraft-0.23.1-linux-x64.tar.gz"
      sha256 "28a4d9f093a33702272f0b6f8e51150d5e8c7fa0631d6f1c0976ae3394070093"
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
