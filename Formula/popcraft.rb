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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.4/popcraft-0.40.4-darwin-arm64.tar.gz"
      sha256 "2461d8500dd4c6a80491dcf8616618ba1e5487783ca4679edf55f8522e685e18"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.4/popcraft-0.40.4-darwin-x64.tar.gz"
      sha256 "0fd5e857058f71871b6dc07872b875759ed2087f13ed11b983232b120b06a702"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.4/popcraft-0.40.4-linux-arm64.tar.gz"
      sha256 "e3a516df8109dc050a284f03113713a7367749af2389b9fecadb71c490191b97"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.4/popcraft-0.40.4-linux-x64.tar.gz"
      sha256 "99ac003dd310e4a7e19ecfa0ef016e7a9cb3c4a8694d155634db4e8f5d87daad"
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
