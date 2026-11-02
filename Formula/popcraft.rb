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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.2/popcraft-0.56.2-darwin-arm64.tar.gz"
      sha256 "41a76174e86adf033ca18d4fcc37084192ffa792a4e8dc336d8202d1aab1aecf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.2/popcraft-0.56.2-darwin-x64.tar.gz"
      sha256 "1a03264a8f03d96d558a02046b32ea035a6e6dba778741e7e7fe7cb22d658660"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.2/popcraft-0.56.2-linux-arm64.tar.gz"
      sha256 "5be0864fa6e5336951cb9da763ea1b54d28d25222c3763925e87e598756bd52b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.2/popcraft-0.56.2-linux-x64.tar.gz"
      sha256 "49f9ca2b025fd28280b537633c71aa361da178d22d261105a360a1053b8c4d60"
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
