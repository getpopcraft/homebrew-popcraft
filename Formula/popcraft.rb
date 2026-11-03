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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.0/popcraft-0.59.0-darwin-arm64.tar.gz"
      sha256 "65a5d99c2a9ebeca817e3e5dd8921ec09acc72c993fff01191f0a028d84d9aba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.0/popcraft-0.59.0-darwin-x64.tar.gz"
      sha256 "d5fbce10fddf9b2492f219dff7fb8f0b1acbf107b883df6c6529563938af6010"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.0/popcraft-0.59.0-linux-arm64.tar.gz"
      sha256 "d83ab851044983079867ed343a3f19af64888067f341984d841a88ee1627d3fb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.0/popcraft-0.59.0-linux-x64.tar.gz"
      sha256 "8f2c94fc57b88b7bcc95e3693fa54c6fefa52cfa749875fbdf9234c76957c39f"
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
