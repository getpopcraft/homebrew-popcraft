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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.3/popcraft-0.56.3-darwin-arm64.tar.gz"
      sha256 "554663cdf00ee6d68d009556193e73b7cdaf34f045605b86ab9e9cfe9435a9dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.3/popcraft-0.56.3-darwin-x64.tar.gz"
      sha256 "ccaf9a00321a9e392234c4b525fcd4198f149c2ca8355fcd41399cc787d92c3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.3/popcraft-0.56.3-linux-arm64.tar.gz"
      sha256 "5471f8e9e4f5bc4fd34fe956302af05f6a3af6a3fc74555037ba38bbc80474a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.3/popcraft-0.56.3-linux-x64.tar.gz"
      sha256 "d1864380de11eb59dfcb5b5b881dbb3820617dc92f236314db5474c496bf9981"
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
