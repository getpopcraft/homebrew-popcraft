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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.0/popcraft-0.57.0-darwin-arm64.tar.gz"
      sha256 "9343ca661af6be2895a69f59267ab80ddfe5c37c06581d3dbdf66e83e5ea0566"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.0/popcraft-0.57.0-darwin-x64.tar.gz"
      sha256 "e52dbe9d5370706b672958ccc4d63db910033d2f8eac1617531b96f3a53f7caf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.0/popcraft-0.57.0-linux-arm64.tar.gz"
      sha256 "be912f0955c1ab073a5cc742ed66db3d982a67ab8f552de2641c3d4eb2d98141"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.57.0/popcraft-0.57.0-linux-x64.tar.gz"
      sha256 "59b2a0e6990afdc8018029458c0d614596ff79d7e0d48dbd145317dbe30053cc"
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
