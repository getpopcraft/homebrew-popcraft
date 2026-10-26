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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.17/popcraft-0.53.17-darwin-arm64.tar.gz"
      sha256 "ece35b9b21826f474b54240854b129d08bd1b16b8a7c7696514ab66705096d2a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.17/popcraft-0.53.17-darwin-x64.tar.gz"
      sha256 "6f990e7ad7e278b8159e8e30490c3d9d2d64d6d29e2956227500c70c2b0932ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.17/popcraft-0.53.17-linux-arm64.tar.gz"
      sha256 "dbaab82df0cc4c4a6fb2cf1553aee9b4b26e45b9e499dda4897ff171a2d8f45c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.17/popcraft-0.53.17-linux-x64.tar.gz"
      sha256 "be3370b113160f43dbcce4693bb4528da5ceda7d1f01c617e24e6a0c7cdb87d4"
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
