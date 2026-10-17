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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.2/popcraft-0.43.2-darwin-arm64.tar.gz"
      sha256 "1c9eb4af3685fa3c663a91de02fd567583fdbf55ccb16fa805d86d7e65886e6f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.2/popcraft-0.43.2-darwin-x64.tar.gz"
      sha256 "ef29da27876e8320d30c93e225e8ae7107e710e553fd817daf203341643f5b66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.2/popcraft-0.43.2-linux-arm64.tar.gz"
      sha256 "23e6b27d4eeb1ed2accc5413ce1af32653179c3053cf7127aa3d4fe571e0f8d4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.2/popcraft-0.43.2-linux-x64.tar.gz"
      sha256 "f475925994dd8451d1aa630ffeafdd7ef72e8a4fb75b9a96d464708f58ae286f"
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
