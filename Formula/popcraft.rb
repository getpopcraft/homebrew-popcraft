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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.1/popcraft-2.1.1-darwin-arm64.tar.gz"
      sha256 "f755fa509cea0da74d2f3667eb39c042f20eb3662e5fd9ce100b35cff1941a19"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.1/popcraft-2.1.1-darwin-x64.tar.gz"
      sha256 "167b6737b73b9679652b584c5031b6c4b20d878d15561675fed60ece829d225b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.1/popcraft-2.1.1-linux-arm64.tar.gz"
      sha256 "90ca011ed9e078a0c84670289667314961528e3f3c8a7abdc1ba40a75cc0423c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.1/popcraft-2.1.1-linux-x64.tar.gz"
      sha256 "609290db3fe109096fd934645db23b54beb3fd545379461ac1d755eb8616b14c"
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
