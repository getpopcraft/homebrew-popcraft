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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.12.0/popcraft-0.12.0-darwin-arm64.tar.gz"
      sha256 "0c0533523706a62547c768c7a818a1bdea6552c39b2189b7948c4974b0309b5e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.12.0/popcraft-0.12.0-darwin-x64.tar.gz"
      sha256 "fa95b18ede84ff45caeadc3c8ea550e525aa417d5303fca30db60c18bd6f6208"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.12.0/popcraft-0.12.0-linux-arm64.tar.gz"
      sha256 "9843393dfd631dc9f95d525af3003774371012d0e08fefbc41377be15b3dab92"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.12.0/popcraft-0.12.0-linux-x64.tar.gz"
      sha256 "cf46d69270d62a4d39fb2a5c3346b1023b30e84ad3381c3f8a8fb31188e1f947"
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
