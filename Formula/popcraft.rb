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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.31.0/popcraft-0.31.0-darwin-arm64.tar.gz"
      sha256 "59e4eaa91ebbbbeca7f2b94441ff4fdc31e8053d6767be635218e4f24beb31c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.31.0/popcraft-0.31.0-darwin-x64.tar.gz"
      sha256 "9f1ad8aee5fd86ec63b5a0dc17c2fcc2f4737f111fe11bcec93259a9f2b4ed3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.31.0/popcraft-0.31.0-linux-arm64.tar.gz"
      sha256 "fc85fe01b29a91644f916ee0e7dfa24eabdbc641f0983d8c554e0efcb78e6677"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.31.0/popcraft-0.31.0-linux-x64.tar.gz"
      sha256 "00e15c2861ff3e32be65205f8fe3c9df8f9f1015671e505a230d3d789aa48741"
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
