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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.1/popcraft-0.9.1-darwin-arm64.tar.gz"
      sha256 "8b6aeb5fb202835615f151d22f0c3a1a8db78d257c798957c88845bc476bcfac"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.1/popcraft-0.9.1-darwin-x64.tar.gz"
      sha256 "4bd19def06ee07a315a0579b6726830108050f183a3a9e27a5a75f5fe5e97075"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.1/popcraft-0.9.1-linux-arm64.tar.gz"
      sha256 "aee8c0d39c6c070c0be96169977b6a71e1d14ea0b61c037ee0c7f52542955341"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.1/popcraft-0.9.1-linux-x64.tar.gz"
      sha256 "06921306e1b9f318a13e5371d84c7c99a3bc82112edb8eebfd88d2a47e575122"
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
