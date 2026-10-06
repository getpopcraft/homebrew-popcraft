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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.3/popcraft-0.8.3-darwin-arm64.tar.gz"
      sha256 "ca816d643281190ede7db856887499d331cb23be6e50cff83774f819a9a019f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.3/popcraft-0.8.3-darwin-x64.tar.gz"
      sha256 "5f0d32d11d8756b03c2c19b74be3ec8f487e5abe3399ae5f6fcd0c7434c33e57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.3/popcraft-0.8.3-linux-arm64.tar.gz"
      sha256 "3682a7e11f72d93a9aeeda61832aa39c3bab7543631c4dc80cf75f209fecfc62"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.3/popcraft-0.8.3-linux-x64.tar.gz"
      sha256 "27d6979283b805a7f0446ea52163e3a2d67c251ec6e6dcf1d15c2d4e7ed55aa5"
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
