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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.2/popcraft-0.40.2-darwin-arm64.tar.gz"
      sha256 "6ba05bbbc24f7bac8730fddd7e1cbb03c45bc82c703a96de1bb5316d73ad03b9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.2/popcraft-0.40.2-darwin-x64.tar.gz"
      sha256 "172050a564f36fee17998bd4506a8e4b88554cdf970de86dfacdce51eba8b9da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.2/popcraft-0.40.2-linux-arm64.tar.gz"
      sha256 "c312a313e04c5b38d54ea5cc2313cdf4f37701d6966da9b047e9a2af5b2ee32b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.2/popcraft-0.40.2-linux-x64.tar.gz"
      sha256 "5ba2a1259b92babd695fee18336768201f8a78748ac7e891c46a994b68b5fbb5"
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
