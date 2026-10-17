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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.0/popcraft-0.48.0-darwin-arm64.tar.gz"
      sha256 "fa8ed0f157fed626c7c44e2af36eb9da7cb2a624a6b1ec7780de7c5b86e8ed7f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.0/popcraft-0.48.0-darwin-x64.tar.gz"
      sha256 "c68daf688e1e1ab9a52f8a79b3c0b3f4347efe68138cd95e7284946b07fa81c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.0/popcraft-0.48.0-linux-arm64.tar.gz"
      sha256 "5bc9121f4d39d7a732e8deaee4a533aaeae5ff7d805cf51d17b0b54920220bb9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.0/popcraft-0.48.0-linux-x64.tar.gz"
      sha256 "8a6827e082a892d0d23539453eef5c8e99f15c46b0637547f4b667ba3e10fc6e"
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
