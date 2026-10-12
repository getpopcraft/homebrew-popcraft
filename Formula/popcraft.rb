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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.1/popcraft-0.38.1-darwin-arm64.tar.gz"
      sha256 "4ee5784cb31d07a1ba2787c9ee8c0b8fc3a24cb256881bd3db8fc1e406f50445"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.1/popcraft-0.38.1-darwin-x64.tar.gz"
      sha256 "d612b0837fffd137368f50f0ee23ea8227ce8298f893b84ee52a709ea4445b04"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.1/popcraft-0.38.1-linux-arm64.tar.gz"
      sha256 "031f7f7d7855a15c0809aacc1af513cf997b17136f534a7c9f19cbd8cfa39bd6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.1/popcraft-0.38.1-linux-x64.tar.gz"
      sha256 "95b34c0216f21ed74706f20c3b403b833067b28fdd068395738b3488c35a522b"
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
