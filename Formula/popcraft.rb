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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.27.0/popcraft-0.27.0-darwin-arm64.tar.gz"
      sha256 "794b83af48aa4323842468a0a896bf4574bc78fb899b9311261b2c7e52b532f2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.27.0/popcraft-0.27.0-darwin-x64.tar.gz"
      sha256 "f4645e348e45e102ca9bc7d1258894d57109ebb806de14d5d71ba193eff8cd38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.27.0/popcraft-0.27.0-linux-arm64.tar.gz"
      sha256 "d397ffcd30e2cebce4930aaff863cd851251229a9fb6333aaaa5b5d0c1dd9e4e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.27.0/popcraft-0.27.0-linux-x64.tar.gz"
      sha256 "4344bd30d7df045383c61817681b5e59bb5b68fb345be55a9012a803948b7127"
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
