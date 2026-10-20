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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.0/popcraft-0.50.0-darwin-arm64.tar.gz"
      sha256 "c044abdd22d16fa31cd74a4c76e6b7517d2723d9d717c31c46c0d5849207cf0e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.0/popcraft-0.50.0-darwin-x64.tar.gz"
      sha256 "397e04fc374c1530a174f76bb4a0eb2ac78f3d3cc0e16d2b80fe4e7c7d23d099"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.0/popcraft-0.50.0-linux-arm64.tar.gz"
      sha256 "76f9adc067594030c97dc99d3012c07a4f795a3aac3309db433dd3f328b325ae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.0/popcraft-0.50.0-linux-x64.tar.gz"
      sha256 "577c5bb62450d7985106c94a06e0bac1e21b89a8d82697ca547f24d470f852f5"
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
