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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.16/popcraft-0.53.16-darwin-arm64.tar.gz"
      sha256 "756ae16de4ba66b2e74a586d80e8f8a5ade8af0e9b625614200a50182fbe6b7e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.16/popcraft-0.53.16-darwin-x64.tar.gz"
      sha256 "8e339eadb5712e55ed2bce7431d6d313c375e5f1027f2ab409a8e6dca9be0ae8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.16/popcraft-0.53.16-linux-arm64.tar.gz"
      sha256 "90a140eb56239989717355d33292d3ed7b62e10e477cd631589745e2a2e1c8dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.16/popcraft-0.53.16-linux-x64.tar.gz"
      sha256 "2687116b3a7df931dceca6f9f072a27a6bca508d5db0d607785b3ffbae0de8d4"
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
