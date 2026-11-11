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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.0/popcraft-1.2.0-darwin-arm64.tar.gz"
      sha256 "7aa4927963672c5795b9be97ab7e0e9174049c5f1170ec6b77ed6d4fcf22378d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.0/popcraft-1.2.0-darwin-x64.tar.gz"
      sha256 "490444a1d87ff596d5b26156278425d0d8a5a7f545d536e03687289ec598c8c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.0/popcraft-1.2.0-linux-arm64.tar.gz"
      sha256 "f34da344e0a041ecd31111158eb51813710f15e0bd94e110d1c27eac600a121b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.2.0/popcraft-1.2.0-linux-x64.tar.gz"
      sha256 "2e1816e21127541b917bbe7582e25516efb46b7520958ff287282e84dea2ef07"
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
