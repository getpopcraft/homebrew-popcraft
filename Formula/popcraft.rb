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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.17.0/popcraft-0.17.0-darwin-arm64.tar.gz"
      sha256 "9052a5738a90ecab32da04c04198fc44dc198edb23a63ec8b374461410caeed2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.17.0/popcraft-0.17.0-darwin-x64.tar.gz"
      sha256 "9037ad84f2cac1db7c291c053e5a2d9664ce7393357831ea70b2fba99a63cfb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.17.0/popcraft-0.17.0-linux-arm64.tar.gz"
      sha256 "411a18436683dd4a706ce0834f7a4f0f254f2ea0766892fbfb0209e52a9aeb17"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.17.0/popcraft-0.17.0-linux-x64.tar.gz"
      sha256 "a9e1588e9ac72478f1817e863bdd5332ce6dd1c36b95e2a566bd12c72d8925a7"
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
