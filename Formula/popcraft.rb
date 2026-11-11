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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.1.0/popcraft-1.1.0-darwin-arm64.tar.gz"
      sha256 "96442e035b02ff04f617795671446e2dc197eb7cdede46bdc0e329fbd62c7082"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.1.0/popcraft-1.1.0-darwin-x64.tar.gz"
      sha256 "5fcab91222e784abfe0c81ab40dc64759038dca8a31533735e4d10b4d86d9264"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.1.0/popcraft-1.1.0-linux-arm64.tar.gz"
      sha256 "a0e800d1c475d6c7a6761862427169f4514a2bd75b70a49f50af4d0e17bbb6e2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.1.0/popcraft-1.1.0-linux-x64.tar.gz"
      sha256 "9daa572fd77a5b8706c3a12dd3c3199b4d1afb8974a95de8966590e15b32a2aa"
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
