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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.19/popcraft-0.53.19-darwin-arm64.tar.gz"
      sha256 "e7c28271eb28cd8ac62a9ddb83ca05c84aa265d9dc69d03bef8f4265aefd6c75"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.19/popcraft-0.53.19-darwin-x64.tar.gz"
      sha256 "debfd67f2f1d4e0b2bb80e391e558202505c4d0f4596a291eb3665592ed43b76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.19/popcraft-0.53.19-linux-arm64.tar.gz"
      sha256 "a1115e2aa310bdf6cc0ea229bf3fe963417b6c56954c2484094b10acd927e379"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.19/popcraft-0.53.19-linux-x64.tar.gz"
      sha256 "28bbc7a4c8350e81c9410567fdd3171045cd53b578f7b2acf833a35a3590f409"
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
