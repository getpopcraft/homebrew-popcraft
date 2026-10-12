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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.37.0/popcraft-0.37.0-darwin-arm64.tar.gz"
      sha256 "35ddecbe607b5946eb9d979e3121cd44a0aa34ec90b2d4146082af247d6fd193"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.37.0/popcraft-0.37.0-darwin-x64.tar.gz"
      sha256 "2b758e2a62aa8036e4ddc1697568d8258f941b85a5ab1ddecdbd1805e0c50a20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.37.0/popcraft-0.37.0-linux-arm64.tar.gz"
      sha256 "38321321e4dbedf54c673b56fe6e7b72994000ce9c32f6e6501f13c55ea15ff1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.37.0/popcraft-0.37.0-linux-x64.tar.gz"
      sha256 "4396b8e7e74a2817b6a2fa83ee7490ff34f28fbc11708c7830b6d9b7973b059d"
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
