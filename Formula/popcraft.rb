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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.0/popcraft-0.61.0-darwin-arm64.tar.gz"
      sha256 "86bf51bf25cd7c61fbddcf23197b743299ff3557b47af8c99c65bbef989b996a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.0/popcraft-0.61.0-darwin-x64.tar.gz"
      sha256 "44b40907a87d9e0b2e75f68fb3369be7bc20ef0c56ebbf39885cd00f81be4577"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.0/popcraft-0.61.0-linux-arm64.tar.gz"
      sha256 "3817b42d2234aaa0244c92ba1bafe27463c99a42074a9db7dc2ece3906f91d87"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.0/popcraft-0.61.0-linux-x64.tar.gz"
      sha256 "48d7d3cd0163697d6bff56b3f680b6bd4ed266b3eca9008c662e7c349ceee283"
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
