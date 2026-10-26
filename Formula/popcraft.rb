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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.20/popcraft-0.53.20-darwin-arm64.tar.gz"
      sha256 "6626eab35cab20c8d4ab324d6c7eb02244640f9cf32dba81338686caa6ebe275"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.20/popcraft-0.53.20-darwin-x64.tar.gz"
      sha256 "45cee2e53d221aea90f160900505414083b025be316803b836e25daf664ee4ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.20/popcraft-0.53.20-linux-arm64.tar.gz"
      sha256 "94104548cd1e79b2c5393affd09831d9d5074e804ca3bcb8acfa105f27983cdc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.20/popcraft-0.53.20-linux-x64.tar.gz"
      sha256 "19f0c90931d84e3187130ad4ea5038e509b9388a20de893c2e6bf29a8b73c137"
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
