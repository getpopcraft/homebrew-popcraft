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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.1/popcraft-1.8.1-darwin-arm64.tar.gz"
      sha256 "37df6ff143d65781e2d84f6b48adea66673fd0495fee3b13828eabb68694be3b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.1/popcraft-1.8.1-darwin-x64.tar.gz"
      sha256 "094493d02309aa1183bc842aa7d3183557060fcda692c443e86372de57577dce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.1/popcraft-1.8.1-linux-arm64.tar.gz"
      sha256 "4a6d2284c36cb47a644da508a814402fea7932269935ca7991c75678f056a13d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.8.1/popcraft-1.8.1-linux-x64.tar.gz"
      sha256 "588111132f70796eec76a83c488100acba7c6f421734b0b2086cf8940da3c5f0"
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
