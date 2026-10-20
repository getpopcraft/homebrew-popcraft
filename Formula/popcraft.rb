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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.2/popcraft-0.50.2-darwin-arm64.tar.gz"
      sha256 "a8bd55746d58221b3db127faf4613e6ac8e292a8ff3895106624aa4e3dc48e52"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.2/popcraft-0.50.2-darwin-x64.tar.gz"
      sha256 "c83d5a384bd8a283dcfc7ed730b13bfe42e899bb3459e03ae683c956d61e1883"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.2/popcraft-0.50.2-linux-arm64.tar.gz"
      sha256 "d92846bf2eb6052ca00c33650268b3282fa2ba87496378903a21bf2aac50fb59"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.50.2/popcraft-0.50.2-linux-x64.tar.gz"
      sha256 "7553f0eae9cc9aedd69e6bf9c524083b79a75af8185804a63625324d52ce55d6"
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
