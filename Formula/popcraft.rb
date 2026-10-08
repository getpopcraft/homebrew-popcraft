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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.0/popcraft-0.11.0-darwin-arm64.tar.gz"
      sha256 "b036a5155d9a707739eff54df92f4cc2557003579b1329f5825723338902b46d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.0/popcraft-0.11.0-darwin-x64.tar.gz"
      sha256 "a3a1b907f436d3333744171816ae70a3e063cdf827601ce0aef0fd7577559060"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.0/popcraft-0.11.0-linux-arm64.tar.gz"
      sha256 "989151d970d8ff9cb7238528c02e1e2c9a5a7bae8bb1f28107489126ff7bee3f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.0/popcraft-0.11.0-linux-x64.tar.gz"
      sha256 "a10fb70e9df0843db22d9c9e7ed9209b0153e8341c33b05069d61c1156e1bbb0"
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
