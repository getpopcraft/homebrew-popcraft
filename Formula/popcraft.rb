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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.0/popcraft-1.6.0-darwin-arm64.tar.gz"
      sha256 "b93d371251dd2390e835e9354ad725344d1de0262b94483cbfa445b9e0751529"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.0/popcraft-1.6.0-darwin-x64.tar.gz"
      sha256 "4850a950042c8da935ab530c951f3195918f9482c95ced867edba1ac919b8597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.0/popcraft-1.6.0-linux-arm64.tar.gz"
      sha256 "599c014ca917ccbce199c556e4cab06809a953fc6fc646ff507c0230cbf1e359"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.0/popcraft-1.6.0-linux-x64.tar.gz"
      sha256 "732554b345733b9b71f93d0dcfa1231a8ea5e1dc200a73477bcf0eb9a2338e84"
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
