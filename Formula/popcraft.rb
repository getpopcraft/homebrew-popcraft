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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.1/popcraft-0.59.1-darwin-arm64.tar.gz"
      sha256 "c6139a7c4d0d2926245ee82bcac6c5078ebf617017b0940f4a4f5bc02de0956e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.1/popcraft-0.59.1-darwin-x64.tar.gz"
      sha256 "b1c67d69cadf276976e6ec516b7c945c50932fb7a10c301af2a9f3338eee5c65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.1/popcraft-0.59.1-linux-arm64.tar.gz"
      sha256 "32697ba89f0e31e99c116c712a92a310ee7ca0df36b16e32245c6c4521e3d6eb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.1/popcraft-0.59.1-linux-x64.tar.gz"
      sha256 "ed0a883b1718df02ed30c2d4d366f45ddb3b0a5e49e00e9d13bedbb48e72c2e3"
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
