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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.2/popcraft-0.24.2-darwin-arm64.tar.gz"
      sha256 "95cb29543fcc1fca0999e9b901c3e75e34ace8355cc3092f57be0360eb437a3c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.2/popcraft-0.24.2-darwin-x64.tar.gz"
      sha256 "af479180f273630fe6cff807bc7a1fc9a292f89b3951e0b54df5edf4ff0fa522"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.2/popcraft-0.24.2-linux-arm64.tar.gz"
      sha256 "db5112347be3169a127ae50ff6010bdee2213f01504ab512fa04e647832d5107"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.2/popcraft-0.24.2-linux-x64.tar.gz"
      sha256 "6cb88a4af6fce2f2584bbf0ea803acbd4fc0b0ff62cbb8ffcbab649d437b3fdd"
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
