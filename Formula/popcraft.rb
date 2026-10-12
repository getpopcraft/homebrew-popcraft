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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.0/popcraft-0.40.0-darwin-arm64.tar.gz"
      sha256 "4ebc06965006aadeb52e0f327d35370830fffc74de028740a0616b1de7d587fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.0/popcraft-0.40.0-darwin-x64.tar.gz"
      sha256 "ac228f314e0372374ceea9b59f6a2c0315f20b6ff3fc56359c0070d64784e9b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.0/popcraft-0.40.0-linux-arm64.tar.gz"
      sha256 "b9e9365afe138f4897905462c5078cf4968346ccc99df524a912a619b4ed925b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.0/popcraft-0.40.0-linux-x64.tar.gz"
      sha256 "8d4fa51e0a6861bdefb5d951a0a35edc9b92b134f3e4e3fbb23a1ec61de37b56"
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
