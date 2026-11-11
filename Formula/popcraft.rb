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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.1/popcraft-1.2.1-darwin-arm64.tar.gz"
      sha256 "5fa0da4260386701c58c97a0298f95f68ad1281763ab0a9c17ffa381b4b5cde3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.1/popcraft-1.2.1-darwin-x64.tar.gz"
      sha256 "78bc389b296495950b15d7626f3a15f89fe5ceed58e5d68d1b9188eb261ac2d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.1/popcraft-1.2.1-linux-arm64.tar.gz"
      sha256 "df07ccdfb1456b9596d97cb34ec6598b9592b1eeb2d3be1ff4aa312444d22230"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.1/popcraft-1.2.1-linux-x64.tar.gz"
      sha256 "6aa7b64f45c75c51c5871e74b269e0887454cdc26bb28a7c368e2b98c76cc0be"
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
