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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.0/popcraft-0.58.0-darwin-arm64.tar.gz"
      sha256 "fc2c759eb4f1ad994f67a56d165d6c118aa6d38231a4a65588f861350e8bc0ef"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.0/popcraft-0.58.0-darwin-x64.tar.gz"
      sha256 "2295387cffe33b00ad7c1992ebb01e658941208c09e8e17e18a167b7e888bd81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.0/popcraft-0.58.0-linux-arm64.tar.gz"
      sha256 "4a56ca746f7499c07c5219bf9899c5cc22ca68ea8a7cbbb014aa9e4b8c7a224b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.0/popcraft-0.58.0-linux-x64.tar.gz"
      sha256 "652db44addd3a0eb4c40f83814ec100dcb2064e194bb31349e47509c541fb74d"
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
