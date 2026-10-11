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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.1/popcraft-0.26.1-darwin-arm64.tar.gz"
      sha256 "5be2beba5557027d2105156a2ee4fff53dcfe3014605799fce516e5fbdff5ca7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.1/popcraft-0.26.1-darwin-x64.tar.gz"
      sha256 "b117c84ef3e18c3dd500ebd8b5baec09ac4a9e0c87863224e9c50e52fc4c6b4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.1/popcraft-0.26.1-linux-arm64.tar.gz"
      sha256 "d47f1909e5f44c6dcf6f0060044da5260d7759e6047052bfe439e0142b3a5aab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.26.1/popcraft-0.26.1-linux-x64.tar.gz"
      sha256 "b9f7de49d0cd2641ce5b8ee693aa53d4d72dd1f0f6d36c46de9c9878caaab45e"
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
