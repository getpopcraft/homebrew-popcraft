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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.1/popcraft-0.58.1-darwin-arm64.tar.gz"
      sha256 "9bba7cd4c5a7b0384ec626deb2e4af6232eba21047c7414a2bed0b441c694ac2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.1/popcraft-0.58.1-darwin-x64.tar.gz"
      sha256 "2257df5193c98dd80ee59256c8a61892189808f41de2eb51570d5155e750c785"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.1/popcraft-0.58.1-linux-arm64.tar.gz"
      sha256 "459981fcc97d50714862a6148944694242119449b332770892748e5d59034298"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.58.1/popcraft-0.58.1-linux-x64.tar.gz"
      sha256 "8452e237d0f71929daf616af1a23b2325c9265dfe778e023674b0e784718136b"
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
