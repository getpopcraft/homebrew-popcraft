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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.18.0/popcraft-0.18.0-darwin-arm64.tar.gz"
      sha256 "4b05e0b3208a3c492e04258c7ff14843d9bef2cbcc55f5a03a4555a930d8b982"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.18.0/popcraft-0.18.0-darwin-x64.tar.gz"
      sha256 "15f7014fba5f755003b0918cd512f2d66aa575e6f1b21eb4362e515f0c2bf81e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.18.0/popcraft-0.18.0-linux-arm64.tar.gz"
      sha256 "45f257da3d6b4fe01b5cd0c65711300bfad24fc3ac21cd6359ff0d54a405f71e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.18.0/popcraft-0.18.0-linux-x64.tar.gz"
      sha256 "9c5458eb1cfdf80990ace17949cd2b8d8ca58c1f52aea679ec8886809a9daef6"
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
