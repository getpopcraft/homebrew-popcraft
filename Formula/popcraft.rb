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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.8/popcraft-0.61.8-darwin-arm64.tar.gz"
      sha256 "d2c807e9839e310825fc824234b57a12ee1cb360da05fc614572deb16d3cd4e1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.8/popcraft-0.61.8-darwin-x64.tar.gz"
      sha256 "5bdc9606e9228926fe02555629f0051d944f29bf836bb21ec198c3557d3a429e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.8/popcraft-0.61.8-linux-arm64.tar.gz"
      sha256 "a35cd746cc528e30a258951ef2f8d450c8711700d34b497db5e46fd7dcdecdb8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.8/popcraft-0.61.8-linux-x64.tar.gz"
      sha256 "d542b3cb04e580e3d4a269cf1071546b34188ad49be20e907843594a44b3df31"
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
