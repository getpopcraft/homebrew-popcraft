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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.46.0/popcraft-0.46.0-darwin-arm64.tar.gz"
      sha256 "5e4f05f62f6adc1c35145abc2176ff722aa320fe38cb019445cfeb5a59919ccd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.46.0/popcraft-0.46.0-darwin-x64.tar.gz"
      sha256 "90bfae3ef5147b4262e0489eba3f77622f674ac8d49f059866b8e32b4e53b5d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.46.0/popcraft-0.46.0-linux-arm64.tar.gz"
      sha256 "dfb21c7d6fee5fabb31b0ba41d6a40ca940451eb67ed9e8b724064d94f98b3e7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.46.0/popcraft-0.46.0-linux-x64.tar.gz"
      sha256 "8c714152551dfcef1c88d86f001d9d71a8267947baa2f7aa7a6835e6f02548ec"
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
