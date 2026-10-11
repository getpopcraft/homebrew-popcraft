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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.2/popcraft-0.23.2-darwin-arm64.tar.gz"
      sha256 "4103c3915db0c47223d15f4f51b41dd7df9c8a38106fc06925b868589b83201f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.2/popcraft-0.23.2-darwin-x64.tar.gz"
      sha256 "63ba80282a23e6daa17b8c5a8add8f1a16a65067ee476776248cad06a970a50d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.2/popcraft-0.23.2-linux-arm64.tar.gz"
      sha256 "a925061b9eef985b40f34d80d4a65d3b518ad0f2060e1efb006fbc96fed2fa70"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.2/popcraft-0.23.2-linux-x64.tar.gz"
      sha256 "72353cdcfcf3d67eb7a334397e6bb202f0e85e6f06078c05530aad4ff740c9da"
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
