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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.8/popcraft-0.53.8-darwin-arm64.tar.gz"
      sha256 "34ce88df80172b4dda7495bd93c79d29c9068e6dd25ff65f6add88464e452a8c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.8/popcraft-0.53.8-darwin-x64.tar.gz"
      sha256 "291245724bdf7f04216457ef557a3928bc1c11d3b37d36ec00c50665cc9c776a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.8/popcraft-0.53.8-linux-arm64.tar.gz"
      sha256 "97d40e75de004c07cc81419e8719a0ce64a4e3a47d79902f387e5355906ba28d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.8/popcraft-0.53.8-linux-x64.tar.gz"
      sha256 "af3b75058ccb0b6cbb3d5a0125df0786fd971756a72b8614e9e62b4459353895"
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
