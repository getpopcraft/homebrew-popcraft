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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.2/popcraft-0.55.2-darwin-arm64.tar.gz"
      sha256 "f8d58dd2bb9eaec932244824cdfa6e2f17ec4f4d27e4a6c309ed2d7132f7bf3b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.2/popcraft-0.55.2-darwin-x64.tar.gz"
      sha256 "b09a17eee3c7050e2b4225d357fb900b4d2e1c0d64f1d31e99de1e9c51b14847"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.2/popcraft-0.55.2-linux-arm64.tar.gz"
      sha256 "951effd744377c5b568ee95ab9ac5afc730337030398c2ef9f435cd0536f1634"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.55.2/popcraft-0.55.2-linux-x64.tar.gz"
      sha256 "7a6af1930b8b012c17b69a4ef1929814c3237c01475871c2a66b476d99867773"
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
