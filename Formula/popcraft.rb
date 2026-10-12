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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.0/popcraft-0.35.0-darwin-arm64.tar.gz"
      sha256 "d318c5bc34b8fd758f01b99314647d38ab82abbf9326a9db0d47912b0f9ee837"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.0/popcraft-0.35.0-darwin-x64.tar.gz"
      sha256 "d49c4d067a2534260a4bda7ad26437659f3878a83b71cffad2f6eb22ce60d55d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.0/popcraft-0.35.0-linux-arm64.tar.gz"
      sha256 "7bd40ec310a559e2427a0d92e38dc3115f6e10b6537c3858a37b4453f6582ebd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.0/popcraft-0.35.0-linux-x64.tar.gz"
      sha256 "c5fcbc57e60e44d8045d7d1db2bce3f2c4f57f44205446c9cebdfc9eb290e06a"
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
