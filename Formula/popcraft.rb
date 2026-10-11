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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.0/popcraft-0.26.0-darwin-arm64.tar.gz"
      sha256 "f95f916f7ed0efc9ee4cec3f6cfa08fd87a3b175d8b1ee69ebe805ea2c28df31"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.0/popcraft-0.26.0-darwin-x64.tar.gz"
      sha256 "906a0f6082375bd573d31422ebf77cb4a2ebf4ee33fcf968ddcf1f2f8f6135b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.0/popcraft-0.26.0-linux-arm64.tar.gz"
      sha256 "89004c2205c6b0e735980f7c9a18620e239c6915f196b3718f2a0e93b70bcd1f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.0/popcraft-0.26.0-linux-x64.tar.gz"
      sha256 "4ed85e407b87acfb83f3add3b4dbe4849f536ad69a126b831cb2ce41eccfa169"
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
