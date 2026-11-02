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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.1/popcraft-0.56.1-darwin-arm64.tar.gz"
      sha256 "99ae5adecba8ff9a06c94617b3c4dcb2d8f736fb7d1e1b784445360c0ecf943c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.1/popcraft-0.56.1-darwin-x64.tar.gz"
      sha256 "dbb7740d02fa76c76d7135a1b88bed19790980f6e0c87e18751b6d1d91044855"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.1/popcraft-0.56.1-linux-arm64.tar.gz"
      sha256 "7dba8985d91eaa192fab66bf299b9d8d43d67b94e7f824f4bd56bac20857cae1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.56.1/popcraft-0.56.1-linux-x64.tar.gz"
      sha256 "189b5812fcf26f93f00bd609083c5f690ea44e2cfe293425d448da65c855d5cd"
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
