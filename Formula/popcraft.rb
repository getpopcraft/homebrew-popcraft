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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.2/popcraft-0.39.2-darwin-arm64.tar.gz"
      sha256 "346c300f433545c694e9d478c9529ae9af9707a00aa998573cb7b8287643bc70"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.2/popcraft-0.39.2-darwin-x64.tar.gz"
      sha256 "ea0674edacaab73859ac4b0ffded84bef6e5bafe19310abd69712dda8c5f2e23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.2/popcraft-0.39.2-linux-arm64.tar.gz"
      sha256 "4e9c73ee47505aa1b66dd6715337f2696d1ba7084801432070ab3fac35c7aabc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.39.2/popcraft-0.39.2-linux-x64.tar.gz"
      sha256 "ac89865a9996998649045cd463a24ab3a18fc167008d0b4cebdb6d8d88dedf2c"
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
