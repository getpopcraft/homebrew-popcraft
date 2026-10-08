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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.0/popcraft-0.13.0-darwin-arm64.tar.gz"
      sha256 "06e16c07340ef8871f0c03d79aa4c97078ead30670ca818905bc0021c5c32ed6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.0/popcraft-0.13.0-darwin-x64.tar.gz"
      sha256 "4c941335dbd794cfb53dd27f39b92182aea8b4f50e0562faa2118891c83ffb7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.0/popcraft-0.13.0-linux-arm64.tar.gz"
      sha256 "711628ba8548bba1c8cbac3e93c88fc5a41ba24ea751e3687c14594c856f436b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.0/popcraft-0.13.0-linux-x64.tar.gz"
      sha256 "901fb8817176b582faf0490b7969d144fad2114f820e6a94793566b8dfe92f14"
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
