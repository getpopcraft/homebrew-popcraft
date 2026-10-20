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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.52.0/popcraft-0.52.0-darwin-arm64.tar.gz"
      sha256 "1a4dc1aaa058d1af31d3b8d06ea4efbff02f53422d8439101818dcfb4466c0cd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.52.0/popcraft-0.52.0-darwin-x64.tar.gz"
      sha256 "2ab35960745f52910d91c5dd4b97ee07759d32bb310ea47ed0f46dc897afeb19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.52.0/popcraft-0.52.0-linux-arm64.tar.gz"
      sha256 "f5645d8b15cd06aff2b25ebd0ba62efeafd5713f15559a6bb8369eb860983089"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.52.0/popcraft-0.52.0-linux-x64.tar.gz"
      sha256 "096c101678f859b015176a460f681e5eb52028e7d30cc7dde7fbde78e959f372"
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
