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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.14.0/popcraft-0.14.0-darwin-arm64.tar.gz"
      sha256 "13640b8659da06d84ddce52b751ea187572a423aac574a1caf3f94fba3949977"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.14.0/popcraft-0.14.0-darwin-x64.tar.gz"
      sha256 "31944ce06c3bfb7c6566ba616344d6d6e84d4a48b779c80a7ed6d39543085b0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.14.0/popcraft-0.14.0-linux-arm64.tar.gz"
      sha256 "a67ed0978537fa928417158a1ec53597f6559fa83f4884ce9d702696632f193b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.14.0/popcraft-0.14.0-linux-x64.tar.gz"
      sha256 "d14a1bd37bb4b8b264601a5a84131d88a9e3d1061745ea043b5caf46f11113d6"
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
