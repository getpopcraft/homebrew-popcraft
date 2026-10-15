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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.5/popcraft-0.42.5-darwin-arm64.tar.gz"
      sha256 "0bd8d280ad2a2470709b578f799176716f5b990e3165b372859f7f3c329f17cf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.5/popcraft-0.42.5-darwin-x64.tar.gz"
      sha256 "7bfa65ecd28af4e3642d2589d4bcb76e7125a7630cca11c07b361ef70bf45612"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.5/popcraft-0.42.5-linux-arm64.tar.gz"
      sha256 "9b1c8f023069b93d670a80e34d256b3afcdac6580b6ceea4526053c850d187e5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.5/popcraft-0.42.5-linux-x64.tar.gz"
      sha256 "dbe7031ccfae306c0e7ba62cf8208b0dd64c72ef671057e90b5fc9951152ab8e"
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
