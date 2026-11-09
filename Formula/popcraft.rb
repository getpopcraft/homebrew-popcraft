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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.10/popcraft-0.61.10-darwin-arm64.tar.gz"
      sha256 "2c34d9d7143fa8bdc9d9a4d5370be22b1bc345c6c4b6053c7e90b34238c64f31"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.10/popcraft-0.61.10-darwin-x64.tar.gz"
      sha256 "c940ae6bb5d74b7fb0655776f337b53b3718c801ae90543ecb972706df70a9f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.10/popcraft-0.61.10-linux-arm64.tar.gz"
      sha256 "64fc6791e3fcbec5cc003e1447b98ea494d8174249e4f03ba600d6cf75bbddde"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.10/popcraft-0.61.10-linux-x64.tar.gz"
      sha256 "1d445df1cd280f148deebd6364983c53f160e3671b234df6f17b2443d2ce8572"
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
