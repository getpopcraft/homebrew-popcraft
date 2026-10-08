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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.1/popcraft-0.13.1-darwin-arm64.tar.gz"
      sha256 "a39e4a6dfaed8d7f62c3d11bbb3734159808cec7a692f1c833fcea517f73dc63"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.1/popcraft-0.13.1-darwin-x64.tar.gz"
      sha256 "b7e406cad7be4706e74a9109506418f9083481a0f1f4a81a415b4769c6d9588c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.1/popcraft-0.13.1-linux-arm64.tar.gz"
      sha256 "15bc2662a0a57263b5088e43a6e700e362c4c5abbb17c995f635f542d3e4bac3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.1/popcraft-0.13.1-linux-x64.tar.gz"
      sha256 "ae7e7db7c5b098b9aa0920c1576016c68ad3920e32a133355aef26ab0494c362"
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
