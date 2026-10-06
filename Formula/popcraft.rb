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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.1/popcraft-0.8.1-darwin-arm64.tar.gz"
      sha256 "6935ec59e52a241f32daf113b3509f45013a529f63e08c15dc275f729677d8f8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.1/popcraft-0.8.1-darwin-x64.tar.gz"
      sha256 "3593a51b3c5b6f454a07d84f54bda5ba1d6aa37e6c074652d8dc4ed7e85b8f18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.1/popcraft-0.8.1-linux-arm64.tar.gz"
      sha256 "1526a4f5aff6f0032864a70cfc73de46ca9527685e22e91ceca3e0f512e20a55"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.1/popcraft-0.8.1-linux-x64.tar.gz"
      sha256 "a3de090975555dde59fc1d17e7986a37158dd81ced348da4db3738dd29a84a72"
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
