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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.0/popcraft-0.34.0-darwin-arm64.tar.gz"
      sha256 "8406b41d9093631670bf86be91ff4a185bfd1c718cbd8438a653ef3903ecfdfe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.0/popcraft-0.34.0-darwin-x64.tar.gz"
      sha256 "5393033ff7ad50c4c5001ddfd4a5b3c734896cd2c96f3e21e2626366f77bb1df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.0/popcraft-0.34.0-linux-arm64.tar.gz"
      sha256 "6e59e92e50df6363d2cad5bc4c9bb75044a5df7ba4c98bc37838f80b7a0ea650"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.34.0/popcraft-0.34.0-linux-x64.tar.gz"
      sha256 "2c2ed79927833f9477fef5441685a947be1692a7d057de4740ec3a93fdcd0ace"
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
