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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.5/popcraft-0.9.5-darwin-arm64.tar.gz"
      sha256 "e72f9d3ecdb663de05cb85da7fe0c3b1a7ffacd122bac1bf607e53b7fa516ee1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.5/popcraft-0.9.5-darwin-x64.tar.gz"
      sha256 "61de003680fbdbedf4462de2d567352446fca103d05d7bad15655a7cf69926e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.5/popcraft-0.9.5-linux-arm64.tar.gz"
      sha256 "58fc3c1036fd6c6297ade86d279d094456024af8778febc69458c25bb94ddd36"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.5/popcraft-0.9.5-linux-x64.tar.gz"
      sha256 "c538e72524283b40e4a573d127660517fc4d1570ab006c1d6e87dde612b5d9b1"
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
