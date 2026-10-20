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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.49.0/popcraft-0.49.0-darwin-arm64.tar.gz"
      sha256 "079245b2872004d24f160c41c850d20c0bdc049be3db2a358c09418ffa2a6450"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.49.0/popcraft-0.49.0-darwin-x64.tar.gz"
      sha256 "5ef31247004328cbf60bb75cf86745c4e410c00daa33f6aa7b7fe74233cd63fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.49.0/popcraft-0.49.0-linux-arm64.tar.gz"
      sha256 "8968a514f0ce109869da18ce1e5e85daf7517b927a38e94e32a1545453a1ab95"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.49.0/popcraft-0.49.0-linux-x64.tar.gz"
      sha256 "37d5bb31ffa83380a4d8bfcad9ed18300531041039c596f0e74323f9b6f7f236"
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
