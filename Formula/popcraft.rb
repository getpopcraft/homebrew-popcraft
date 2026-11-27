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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.3/popcraft-2.2.3-darwin-arm64.tar.gz"
      sha256 "5acf669eeb52e935caa3817a43c66ef912420efde4a8c7d77f0accc3011cd3a7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.3/popcraft-2.2.3-darwin-x64.tar.gz"
      sha256 "67a413bf1943d4438dcbb3c3de560894cbbd6bff50bc4c9577e19006abfbaed9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.3/popcraft-2.2.3-linux-arm64.tar.gz"
      sha256 "eb0da47c8bb16c463dec4482bd672f67812eab963092166fe27bd2424a6db340"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.2.3/popcraft-2.2.3-linux-x64.tar.gz"
      sha256 "e2509bf1c0afd253cab986586737ce00c4bdbe9a4c62aed6185f9160ee23a993"
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
