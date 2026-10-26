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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.15/popcraft-0.53.15-darwin-arm64.tar.gz"
      sha256 "b14b84432e5d71b9641d4ddb592755c56aca038e407f2297d8b3b73c53b134f3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.15/popcraft-0.53.15-darwin-x64.tar.gz"
      sha256 "3a0beac5d695e554a4c59b380b60560e8deec356cb1732df350cd93d8b3e3988"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.15/popcraft-0.53.15-linux-arm64.tar.gz"
      sha256 "5ded96e9bf3eb3b15e6c332256bdf2e9322562419eabdd440719663d55f07296"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.15/popcraft-0.53.15-linux-x64.tar.gz"
      sha256 "77b3dcb96106e6cc74edcd11672dfa1d7515ad0b6cca598ec15306e2067da157"
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
