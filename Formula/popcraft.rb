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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.28.0/popcraft-0.28.0-darwin-arm64.tar.gz"
      sha256 "ce4864307e1f918e921450332ac97ebb3baccee2945e0a461c25e89405707da9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.28.0/popcraft-0.28.0-darwin-x64.tar.gz"
      sha256 "4ed09644dbc3f2d84641f6a01b3187a13dbb7b395ffd9cf99f585c734ea8c54a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.28.0/popcraft-0.28.0-linux-arm64.tar.gz"
      sha256 "995b0f35250d2e51809243b17e3aa321c25d2b6f766e5eed5894c93feeeed209"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.28.0/popcraft-0.28.0-linux-x64.tar.gz"
      sha256 "d96a308c88782a210170917732429373eb904875d6064bd9f0321eb1f4f46805"
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
