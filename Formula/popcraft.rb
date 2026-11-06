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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.2/popcraft-0.61.2-darwin-arm64.tar.gz"
      sha256 "92809b123fdbb5fa1fe62547ec68735550ff2287e872497d0bdf3f4759892b74"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.2/popcraft-0.61.2-darwin-x64.tar.gz"
      sha256 "78bc3f85b5b992567ed4754ff5cb0a3c780d4f696b9192f6b00445853b7b9a22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.2/popcraft-0.61.2-linux-arm64.tar.gz"
      sha256 "cef8129465907c2ea9b4d49bcd2160a672356c075188b34fd151975b88f96417"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.2/popcraft-0.61.2-linux-x64.tar.gz"
      sha256 "e71c2415452947a5c909837057572d1cbcf569c60105182273a02719bf4c7303"
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
