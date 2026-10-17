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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.47.0/popcraft-0.47.0-darwin-arm64.tar.gz"
      sha256 "1e6a9ca2f25ce59e19b8dc14a4630a1bc7c6fb15416a34349ce6d45f0e1618b1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.47.0/popcraft-0.47.0-darwin-x64.tar.gz"
      sha256 "5b0b135f39bfa04a934017a0612ec73cfbe0267274ac812a4474edd3cb11ae58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.47.0/popcraft-0.47.0-linux-arm64.tar.gz"
      sha256 "37d922c05f3969c76514d3a4de07c472c81760b7d9c3a7d7a9d593860eff9165"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.47.0/popcraft-0.47.0-linux-x64.tar.gz"
      sha256 "984ec58d518b05c97d26e50b2eb680b8d6cc0de18e8bc2fcf63d6ecac3898a55"
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
