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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.1/popcraft-0.40.1-darwin-arm64.tar.gz"
      sha256 "07d735ddd1ed91e23c6d88a964ea09fadb469e48fa607e2273d41b7243b99f58"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.1/popcraft-0.40.1-darwin-x64.tar.gz"
      sha256 "4c0906c03bc5247359fa31abfba88426112b885b325646268049a015dac2c218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.1/popcraft-0.40.1-linux-arm64.tar.gz"
      sha256 "d72f7140d37f2ba4a3d79879950d86b2bc4335e31e9c3a7ab28a40a819c2e57c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.1/popcraft-0.40.1-linux-x64.tar.gz"
      sha256 "5531c14c4478c07f4a3e496143813b4d5ead869a3d03bfb52741fbfd2d1dd566"
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
