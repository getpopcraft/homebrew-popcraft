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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.0/popcraft-1.5.0-darwin-arm64.tar.gz"
      sha256 "42c8c827703666157fb47fca012ec89ccd2865d0f49daca4002b886aeb81e8bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.0/popcraft-1.5.0-darwin-x64.tar.gz"
      sha256 "7df572fda9021ae1568fe7c3d8755ce1222a9a76e99aac758641d734b4d504cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.0/popcraft-1.5.0-linux-arm64.tar.gz"
      sha256 "93dc03ea50920a3e8c7ab4faff3dfd2bc0fe75b58808425448960e363d1e2e40"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.5.0/popcraft-1.5.0-linux-x64.tar.gz"
      sha256 "4afc3072425e6ac66a7eed6b43bce03272dd062c941e6281b1e3d0bd4ea90dc6"
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
