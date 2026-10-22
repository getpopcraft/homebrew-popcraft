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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.0/popcraft-0.53.0-darwin-arm64.tar.gz"
      sha256 "dad099222072db51d9de21174cc0078c8d08d4707e4d8c0359d5d872e91add46"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.0/popcraft-0.53.0-darwin-x64.tar.gz"
      sha256 "d07b4636feb5f10f5c744a33a87cb529c9b736cf0e380161856b9b4bc8920aac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.0/popcraft-0.53.0-linux-arm64.tar.gz"
      sha256 "3054dc20cf3ba3ce4bec9639c7231a6f8e35e15a7717f6d02e7f2cf235f5c588"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.0/popcraft-0.53.0-linux-x64.tar.gz"
      sha256 "af1ce406ece63dec0c44652093cac85977343d61f6fae03620730f47aa8542e7"
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
