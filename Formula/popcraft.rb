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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.2/popcraft-0.34.2-darwin-arm64.tar.gz"
      sha256 "800c0df47382dbdc952854d94dda78ab1b9773e890d9ec39a40a530e513eaa41"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.2/popcraft-0.34.2-darwin-x64.tar.gz"
      sha256 "3057e0e158731dfd2aad0aea8cc32cdfd786f3af9a13c4aa066e922f20ba0644"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.2/popcraft-0.34.2-linux-arm64.tar.gz"
      sha256 "1397933936b00122c8f88537e3cc33abdf19b225f77ff315134b926b9efb24c5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.2/popcraft-0.34.2-linux-x64.tar.gz"
      sha256 "cf74d9ac2ccdefa5e7719d67068d31f1653ae7a47b71c4572b3057a1ae666c8c"
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
