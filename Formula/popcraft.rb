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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.1/popcraft-1.3.1-darwin-arm64.tar.gz"
      sha256 "74ea3658320843a025e1bd6934e22d508365725e5fd85f8b3851c1fd21d3756f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.1/popcraft-1.3.1-darwin-x64.tar.gz"
      sha256 "f785733d55ae4eca6c1920ad237a3f974e05265f827ff6f2a3be899f52f21e23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.1/popcraft-1.3.1-linux-arm64.tar.gz"
      sha256 "85c7799b2dfaf9ba669c1e61ccc0f002de15955d43506994134775378ff2650c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.3.1/popcraft-1.3.1-linux-x64.tar.gz"
      sha256 "176c5173455fa1e0ae1dda1ece87f4afffb0973cb15de5686d7ad9e84420b814"
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
