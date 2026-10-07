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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.3/popcraft-0.9.3-darwin-arm64.tar.gz"
      sha256 "030e97fe527d3f8e3f22aa26686e2abe249d7447ba7c65b5860513941c1c9254"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.3/popcraft-0.9.3-darwin-x64.tar.gz"
      sha256 "2b90c8b1513fefdfcef895a85e7ca8498a86daefb1bf77b31f3eabafd08d7a21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.3/popcraft-0.9.3-linux-arm64.tar.gz"
      sha256 "6620930daeb67fb1d630211fea0fea8588f7a486606f4cb8358e7b02deaaa96c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.3/popcraft-0.9.3-linux-x64.tar.gz"
      sha256 "ac9961a52ba4186740ea0d71a73d581283b40166549af5226a1d445bfb957d21"
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
