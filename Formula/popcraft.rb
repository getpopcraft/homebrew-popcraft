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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.2/popcraft-0.62.2-darwin-arm64.tar.gz"
      sha256 "f591d5fa2658da8057d4ab4c4d228eb2c7386ccf982c47b37a4a66dad55b2841"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.2/popcraft-0.62.2-darwin-x64.tar.gz"
      sha256 "094e15da6386c9fdbaf69d5cc297a49f8bc1c5a7f44835f66d46f707e9eb954f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.2/popcraft-0.62.2-linux-arm64.tar.gz"
      sha256 "7afe4744f3fa8a5e04f99e888a95d005622776ba4d992299c1401dfcd63f9104"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.62.2/popcraft-0.62.2-linux-x64.tar.gz"
      sha256 "50b4b0d83f0f7e511e8f9e08b5d15bce9180f666f329852ad9c8b8c7b829fbee"
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
