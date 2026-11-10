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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.0/popcraft-0.62.0-darwin-arm64.tar.gz"
      sha256 "6584e08e9afb650b38973374a573d9cff8302c64c33dfa247920eaf38d67e454"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.0/popcraft-0.62.0-darwin-x64.tar.gz"
      sha256 "cddfec02ff3b3d99ce6e8fc671268e90aaf92b2c415ab10b3a505538a9360ce0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.0/popcraft-0.62.0-linux-arm64.tar.gz"
      sha256 "207c25c435948467a69ec2e014b45e6e22efb93a9a04321c865e0dc10d218fe5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.0/popcraft-0.62.0-linux-x64.tar.gz"
      sha256 "40554c9a8045cde5983f627a1ff3c41219be9401bb6a74e6b0f372eab31f8ac0"
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
