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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.2/popcraft-0.48.2-darwin-arm64.tar.gz"
      sha256 "1661a13de1616d32f09c54607635af2db6ae8c5398b1a101390a33309e03310d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.2/popcraft-0.48.2-darwin-x64.tar.gz"
      sha256 "cb0947dedf4088207998fcab91abd3419fc5cbeea883a7e8034b67cc9fea8192"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.2/popcraft-0.48.2-linux-arm64.tar.gz"
      sha256 "c9d7c92e60124880a843082070ea328e913c0bb62e95f891bd72d43988afca16"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.2/popcraft-0.48.2-linux-x64.tar.gz"
      sha256 "46f101dc2a142557eb206c5304ca05310826cf61695352adf7e0796a2eab141f"
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
