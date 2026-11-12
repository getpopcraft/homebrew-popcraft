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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.7.0/popcraft-1.7.0-darwin-arm64.tar.gz"
      sha256 "a4480e74a7e4b0820f0495f213bc0f4679719152362c57a18d85c077718c5c7f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.7.0/popcraft-1.7.0-darwin-x64.tar.gz"
      sha256 "2b4ffc3788d9186a36b06916f343d5a8a8af5a105f5f7a4c0603d6d48ac3bd44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.7.0/popcraft-1.7.0-linux-arm64.tar.gz"
      sha256 "3331a8a3151e2e5298eb9a61346527e7865c8b0ea8bdf983ceed882a36b11cdd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.7.0/popcraft-1.7.0-linux-x64.tar.gz"
      sha256 "ef9373fb4486b9df36cfbf0998a4b5a6a0d0a77850d4cef0a75318e3932a531e"
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
