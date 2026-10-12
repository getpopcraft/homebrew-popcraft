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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.4/popcraft-0.38.4-darwin-arm64.tar.gz"
      sha256 "e55c06bf5b708afca77d056371fd6b33723527890a7355119a24fb6beca4aa2f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.4/popcraft-0.38.4-darwin-x64.tar.gz"
      sha256 "3b8624a6b7df8112cddc57f009e91653d720ae0791f0f9a506d208b440cf5970"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.4/popcraft-0.38.4-linux-arm64.tar.gz"
      sha256 "2946b8e0f211b79f460549fc2eaeb412cc67e73810422ed83392976c57765bfc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.4/popcraft-0.38.4-linux-x64.tar.gz"
      sha256 "dda3ee66209041d97fb6c42091a96249c2153a2548405e0ef294f2766b20fbb5"
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
