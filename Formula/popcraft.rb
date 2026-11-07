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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.6/popcraft-0.61.6-darwin-arm64.tar.gz"
      sha256 "0f7c071c36da9e8091f1c645cf3272eabaecceb64ce7905c0c9fa56b64735a5e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.6/popcraft-0.61.6-darwin-x64.tar.gz"
      sha256 "117cb62c21a037d7d4491952037716e04f87db3a5e131892eca6e69608a9970b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.6/popcraft-0.61.6-linux-arm64.tar.gz"
      sha256 "626eae0a146f6ce9e20c054dff2e8349ff23af25abf584c29d6e389b7133dbb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.6/popcraft-0.61.6-linux-x64.tar.gz"
      sha256 "b570ba7d7bb430c99d8cd7b4c8b30e850eaceec166261cc1b629afa826440dd2"
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
