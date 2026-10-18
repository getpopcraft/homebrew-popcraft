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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.3/popcraft-0.48.3-darwin-arm64.tar.gz"
      sha256 "2c0de1dde3ee4fe3b80b7e098a28b50d16af9101e238a9d9dd8f1734d4fb34f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.3/popcraft-0.48.3-darwin-x64.tar.gz"
      sha256 "9a602bb9ce3f49c4324805fc2fa010165b42658409f412e2383920d01aff13c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.3/popcraft-0.48.3-linux-arm64.tar.gz"
      sha256 "fe2693810db6354670d59f52510670b2273a8d5dc44353cdb537b8f4ba776b65"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.48.3/popcraft-0.48.3-linux-x64.tar.gz"
      sha256 "b50e2bd6f8a8fcea3d6146bf81aa4f2c06c244ad1e61f61dc49c9237966fb469"
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
