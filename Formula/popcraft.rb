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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.0/popcraft-0.20.0-darwin-arm64.tar.gz"
      sha256 "bd4e3849de433eb6534a7e86487a734a401d4508d2aa576e29e27502771c6124"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.0/popcraft-0.20.0-darwin-x64.tar.gz"
      sha256 "874df3eb4480b7b03006edba1b3910b5f6ee076113bb1c405a26600576d03ffd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.0/popcraft-0.20.0-linux-arm64.tar.gz"
      sha256 "8cfc7717ff084d587f7dcd8da298575bf3a1e06252d4ff44d7aab09b85bd9b38"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.20.0/popcraft-0.20.0-linux-x64.tar.gz"
      sha256 "1f5ef0910f4de4943a54d7cdfe45bc1b8d1a0c132c35d4c0648f84cc8ffd08e7"
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
