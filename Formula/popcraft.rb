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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.1/popcraft-0.11.1-darwin-arm64.tar.gz"
      sha256 "927594c8a95e57dd0f0dd00852182f05ef671b8fb8538309aa7ea983cc2fa995"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.1/popcraft-0.11.1-darwin-x64.tar.gz"
      sha256 "d446eb971f42e74984b9efb72bb8c513abeba7964724f5fc947f63dce544a00b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.1/popcraft-0.11.1-linux-arm64.tar.gz"
      sha256 "0befa1172ece67dafa080e8e9689649806a409c5240cc5aefb5b29de9a97eb7b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.11.1/popcraft-0.11.1-linux-x64.tar.gz"
      sha256 "b91eedcba629e2e700b893e1a2d77c5528014c102bac8e061dfd28acfd7ab4af"
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
