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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.1/popcraft-0.50.1-darwin-arm64.tar.gz"
      sha256 "0025fe1aff5aef727c5c9623809c23434a8b9998c3b333f1071bbfdc41c72f84"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.1/popcraft-0.50.1-darwin-x64.tar.gz"
      sha256 "0b0ccce8c44aa17b19e826f35f49fa9c2f2bbb828833fb88ca3b1372d0d291de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.1/popcraft-0.50.1-linux-arm64.tar.gz"
      sha256 "ac7387f96e0b3f81edc53a86d31f38fcbe845d09b247c6c32dd2143424b7d157"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.1/popcraft-0.50.1-linux-x64.tar.gz"
      sha256 "0a9d4d5a564683f9a7049ddb79b95ebba97afb446f897cf9b02b21e921822c2d"
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
