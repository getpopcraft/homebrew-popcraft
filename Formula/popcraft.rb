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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.2/popcraft-0.20.2-darwin-arm64.tar.gz"
      sha256 "21fc4d188c2f88bee90220fc1ea9316c66559aeb39667d507533d722bbc7cdc8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.2/popcraft-0.20.2-darwin-x64.tar.gz"
      sha256 "7061292a37f2045278891073bf6a732f123adc65616805b7cd405fbd357d109d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.2/popcraft-0.20.2-linux-arm64.tar.gz"
      sha256 "2387af97d54e1a5949f30041a113d197518a5f2478bc8c344fefe484e9ed1edf"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.2/popcraft-0.20.2-linux-x64.tar.gz"
      sha256 "cca76e5b3a693f480bec82b18b341a9a9683448d75278716ff40c90304ae549a"
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
