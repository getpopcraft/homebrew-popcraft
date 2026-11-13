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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.0/popcraft-2.1.0-darwin-arm64.tar.gz"
      sha256 "3357fb819a88c19e2e5a6153714fab5a879230e0340eb9b9e59ae92fe96b0643"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.0/popcraft-2.1.0-darwin-x64.tar.gz"
      sha256 "548131941441bdef471a74f4b061fff9e1a40899f2bae0ae6256594c5da33cfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.0/popcraft-2.1.0-linux-arm64.tar.gz"
      sha256 "640240a7c49d8a5ddfcb167e456657cddddffd96c4e7549456c8b1b734e592ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v2.1.0/popcraft-2.1.0-linux-x64.tar.gz"
      sha256 "3396f5171ae8a7d3e3339327b0116c4977d6301aa96925b28d76fd31f4087448"
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
