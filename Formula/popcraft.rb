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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.0/popcraft-0.63.0-darwin-arm64.tar.gz"
      sha256 "29a56738ba446553e32a092e141553242ba1e0044173c60c3572a6f55854b942"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.0/popcraft-0.63.0-darwin-x64.tar.gz"
      sha256 "85d8f513e028c98cf89de41e9bab2bbd8796c3d62be8869ea80fc1543ecc7b54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.0/popcraft-0.63.0-linux-arm64.tar.gz"
      sha256 "079de47b5f7e436832396ac437ee2c25c141e54dda0b8b646925bd172cc34931"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.0/popcraft-0.63.0-linux-x64.tar.gz"
      sha256 "8b6f326ec901a255cec285e9b981d64e7a2a43eb6aeebbe204c1a8b158988258"
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
