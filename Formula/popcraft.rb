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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.2/popcraft-0.42.2-darwin-arm64.tar.gz"
      sha256 "cc92d6c2b5857240b4aba83c22228c836ed3bac8977d06ed9d86663025ff56c1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.2/popcraft-0.42.2-darwin-x64.tar.gz"
      sha256 "a86b262988b5e1cbd40fa7fbe9d987cedd0e6f6d00a22ba0c4defcb5e9849d4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.2/popcraft-0.42.2-linux-arm64.tar.gz"
      sha256 "05ce194868aadf46dc9aeb2d18dde07becf79c51b7bf5849fd0d911a79201735"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.2/popcraft-0.42.2-linux-x64.tar.gz"
      sha256 "a138d0637531f0991abf434d588dae6c85dd1358dd686a30eb189be6f71cb162"
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
