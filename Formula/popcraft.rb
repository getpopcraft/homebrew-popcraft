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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.0/popcraft-1.0.0-darwin-arm64.tar.gz"
      sha256 "eda8e11699cee1eb54f53514ca6a37de6bd4a89165e580a5e0dec611dae12de3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.0/popcraft-1.0.0-darwin-x64.tar.gz"
      sha256 "190010d87790f373e97ec7629fe573bb9b8ac78ab81b3345f7b14dd4f52f4c53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.0/popcraft-1.0.0-linux-arm64.tar.gz"
      sha256 "12200275dee1e002cf4ae38ccf4fb72049874e0395be060403b6aa34dfbb95c4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.0.0/popcraft-1.0.0-linux-x64.tar.gz"
      sha256 "4675e287d12cc7638b3e11fb1c622f55d53889b0c5f011c7e5ea5b00dc320410"
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
