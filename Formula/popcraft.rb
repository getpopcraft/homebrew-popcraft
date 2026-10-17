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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.0/popcraft-0.44.0-darwin-arm64.tar.gz"
      sha256 "e4c653ff1ec79f589a4f7cf3717604ce4370e2db9deb49b59b7fdf1c66f43083"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.0/popcraft-0.44.0-darwin-x64.tar.gz"
      sha256 "eb7450071c3ba002fc97d18aa0a30f4e777884e1a7f10af241d4479b362d8b77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.0/popcraft-0.44.0-linux-arm64.tar.gz"
      sha256 "638f862fd9a28c0161562ce13efc892a633746b8a8a80f8e849a09a415e7bf76"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.44.0/popcraft-0.44.0-linux-x64.tar.gz"
      sha256 "70aeecf2f5ee68912853392e9d5a1ad1cf55ce8d0c4e31d5f236f82b0997ae99"
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
