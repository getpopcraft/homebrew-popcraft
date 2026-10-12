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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.5/popcraft-0.38.5-darwin-arm64.tar.gz"
      sha256 "85d467cc8989cba4d3cd44fe322727e8eb3299be1d3eaf7017f2008159cbce84"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.5/popcraft-0.38.5-darwin-x64.tar.gz"
      sha256 "e6075b1e37afb7678822b6b3f89a58c9baaebc92d6e8b1fdf18e69cdb197f58c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.5/popcraft-0.38.5-linux-arm64.tar.gz"
      sha256 "73c4c5fb2535a8623bb168806a950e17a17747dedeb5a9e8f7fa9d4b66161fd2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.5/popcraft-0.38.5-linux-x64.tar.gz"
      sha256 "f22b882f9f2826b706cc9af2a53ef2fd9774ac53583783a62bbbff2ae3662fc5"
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
