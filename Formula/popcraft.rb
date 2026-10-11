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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.25.0/popcraft-0.25.0-darwin-arm64.tar.gz"
      sha256 "81e202dd816612397809df9a5776af9680f438fc3c265f6f1ba4c9be5c66d25e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.25.0/popcraft-0.25.0-darwin-x64.tar.gz"
      sha256 "91c75f84af4c965525f180a26322bf57d7dc7fc3aee2491bcac4dce08c93c510"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.25.0/popcraft-0.25.0-linux-arm64.tar.gz"
      sha256 "3b3b14a5e4e596f98d1c7f95954e9c5a71bca634ada6fef35f97190f6509558d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.25.0/popcraft-0.25.0-linux-x64.tar.gz"
      sha256 "384610d58abbbfdd523f72d2b6bdfd6a9b7527148f85230c661025691f60262a"
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
