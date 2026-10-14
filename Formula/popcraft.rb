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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.0/popcraft-0.42.0-darwin-arm64.tar.gz"
      sha256 "91a9b718e8685acf08aca92c7df6483444cd6e126afb34ea9aef83cfe8987519"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.0/popcraft-0.42.0-darwin-x64.tar.gz"
      sha256 "47600494ef2131778eb893f91d5e2ef32b49e82595713c8ddbc021d409cec085"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.0/popcraft-0.42.0-linux-arm64.tar.gz"
      sha256 "cb33151695411680349be5d9752af7d4c164988067b9892261406038ccf32451"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.42.0/popcraft-0.42.0-linux-x64.tar.gz"
      sha256 "130d5387d0b1e509950d35b138389861098bb9540bab814dcf460bada41e923f"
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
