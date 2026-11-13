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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.9.0/popcraft-1.9.0-darwin-arm64.tar.gz"
      sha256 "440d2d08827cf8672bc02053dffd5abe2a006ac5dab6cec27ebc1907f3a4fe1c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.9.0/popcraft-1.9.0-darwin-x64.tar.gz"
      sha256 "ddc018d7f86eb6c06f485617eafdcbfbadd074c9a2f14489f8631771967c2bf8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.9.0/popcraft-1.9.0-linux-arm64.tar.gz"
      sha256 "4bdefd5f59b1197f7932c7cac51fff3554a7a239fcc9985217baed04c1865bac"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.9.0/popcraft-1.9.0-linux-x64.tar.gz"
      sha256 "1fd57d0450d971d383292ca5e39a42ffa2299700887934cc8d911e1d9e65495a"
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
