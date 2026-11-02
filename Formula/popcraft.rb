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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.3/popcraft-0.55.3-darwin-arm64.tar.gz"
      sha256 "eabee6ca55c3b3039d38f7c702e848a27f57f18da8e71c3e08197b33aba1848d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.3/popcraft-0.55.3-darwin-x64.tar.gz"
      sha256 "b580e8f1b47cd8a80f5da27c346f89094e2f13391e7cc661d64f1cc0e92e1f8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.3/popcraft-0.55.3-linux-arm64.tar.gz"
      sha256 "3d45d54c9adaac385f112403ea4a08a9ea04cf92563c401a3daf48006bed0ed0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.3/popcraft-0.55.3-linux-x64.tar.gz"
      sha256 "7fa1dd857772a60e8a20c1be29b06a8b20836c5aa192c8c40ad42efe3dfe6293"
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
