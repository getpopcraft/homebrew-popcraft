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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.10.0/popcraft-0.10.0-darwin-arm64.tar.gz"
      sha256 "c6299ab821c63ff8c0a5080cb6c2c1f82bd5506664c967f17ae486b9302f90af"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.10.0/popcraft-0.10.0-darwin-x64.tar.gz"
      sha256 "430b0152d031dd4a4820efa0de01c6a0a1f7c56bd24efccfca1766447457f4ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.10.0/popcraft-0.10.0-linux-arm64.tar.gz"
      sha256 "86f105092a1ccac7e4986be7f2b14e950881604f225527c8f5088d65a3ca392a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.10.0/popcraft-0.10.0-linux-x64.tar.gz"
      sha256 "0b5a6bf573bfeea184b3514e278962ab64078eba01a26b6ab6bc1eaf3c238131"
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
