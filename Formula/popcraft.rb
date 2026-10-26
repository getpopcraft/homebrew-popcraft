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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.12/popcraft-0.53.12-darwin-arm64.tar.gz"
      sha256 "bed5da72f70bf42d4eb7dc9f9f10d75bc814afe3bc571ed3862384429b243ec6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.12/popcraft-0.53.12-darwin-x64.tar.gz"
      sha256 "4549a44207a4c434b144267f73b759b63ffd117d743c45fd3b991e1e84122c84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.12/popcraft-0.53.12-linux-arm64.tar.gz"
      sha256 "ba1b80f10a626e041f26ade646da1f6de925bee46d92f2e548fca26aa696a7b1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.12/popcraft-0.53.12-linux-x64.tar.gz"
      sha256 "a0c38112de63052a50f56b5687cc40b4d01c57c2bc4075a6288dac64988e52ee"
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
