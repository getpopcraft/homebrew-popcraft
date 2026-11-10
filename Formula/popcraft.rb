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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.12/popcraft-0.61.12-darwin-arm64.tar.gz"
      sha256 "26bb6ed410227d58f0feb15748ede2d631aa30794c8846327692e8da71f3dae6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.12/popcraft-0.61.12-darwin-x64.tar.gz"
      sha256 "6b8f25fd8bc47b04c528304a729cda4031711eb23e95af94c2dd730ffdcfe894"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.12/popcraft-0.61.12-linux-arm64.tar.gz"
      sha256 "2b8bf373a158e6b11d0b18f293840ac9d8fb9917c2755421c18fbfe829ab953a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.61.12/popcraft-0.61.12-linux-x64.tar.gz"
      sha256 "1e61fc1dac544631d780c54f5527e5f696662361bfb7fe7b41b05eb89cfe9c15"
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
