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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.19.0/popcraft-0.19.0-darwin-arm64.tar.gz"
      sha256 "a548f1fb4a6927ce5bf6a4aeb6754145bfdc213b3a0f90508263dc36491d2e9f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.19.0/popcraft-0.19.0-darwin-x64.tar.gz"
      sha256 "db99a8ac10037e630f27721759c02eac0c4b8890cbf3dd7598bd6c62553ef27d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.19.0/popcraft-0.19.0-linux-arm64.tar.gz"
      sha256 "41b7c0a1054054321e513bd127cb30681312840081d9d8aaa6a9ecb23dc9e41b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.19.0/popcraft-0.19.0-linux-x64.tar.gz"
      sha256 "d339edf775422d2f8cdc680152982ae47b23901d86de898e79d8d4048c74e0f2"
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
