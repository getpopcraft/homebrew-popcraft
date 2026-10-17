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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.1/popcraft-0.44.1-darwin-arm64.tar.gz"
      sha256 "d2eba5e5f1b5ba308553f91e7cd3b219d1c55a57a91b48aac7cc0f6dcf22f710"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.1/popcraft-0.44.1-darwin-x64.tar.gz"
      sha256 "cbd12bcd5b3ad3595f4cc66809c64d389f669cf63fc794128e6c57de72bdf0fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.1/popcraft-0.44.1-linux-arm64.tar.gz"
      sha256 "4d9c41e01000bb7e60217e2200840b3919415e0b8967d9ff394fe9a683b3d229"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.1/popcraft-0.44.1-linux-x64.tar.gz"
      sha256 "74f495b9a7513da9aee5776604ed49848d7e33daffde8e9c7fd90fc8b0f06781"
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
