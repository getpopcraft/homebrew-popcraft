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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.2/popcraft-1.6.2-darwin-arm64.tar.gz"
      sha256 "ba57060bedb52ebf730332458f6b87d2bb4f5aa3c4ab71927a1cc9e42cce1383"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.2/popcraft-1.6.2-darwin-x64.tar.gz"
      sha256 "e0c03eee5377b79c3f56b717d5853430aea8ba8a5d4b4c1d25776e90e4d5fdc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.2/popcraft-1.6.2-linux-arm64.tar.gz"
      sha256 "e888171944c451245074a5392b23c1235c12f9cfd2b2d9d6fd8c82ce617cc6d3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v1.6.2/popcraft-1.6.2-linux-x64.tar.gz"
      sha256 "f294459655021f990b11e391f34ce50ea7922e115db9bbfaa1dd36f11c3f26e1"
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
