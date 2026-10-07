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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.0/popcraft-0.9.0-darwin-arm64.tar.gz"
      sha256 "39ba3453784428e99ebef37b053f53c19da7621986a3efe51a8a293060184334"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.0/popcraft-0.9.0-darwin-x64.tar.gz"
      sha256 "9a0b6edab170c8ceffef836d8bab486f802acf820a3142046fb195a791691abf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.0/popcraft-0.9.0-linux-arm64.tar.gz"
      sha256 "f51a38eca9ca19f3ee984e733fe3be901b414360c4e3fb550ad2bb097baa519b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.0/popcraft-0.9.0-linux-x64.tar.gz"
      sha256 "66e3307fd027610b23acdd30bacb9a9db7a18f83a731cf84ecc9463953211a2b"
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
