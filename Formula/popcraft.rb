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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.1/popcraft-0.43.1-darwin-arm64.tar.gz"
      sha256 "afeec59ea1078186a74f069df031eac622f620e8020fd92d8bbadd85a8a5cc83"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.1/popcraft-0.43.1-darwin-x64.tar.gz"
      sha256 "0f7718d42d6a5f75eb4c63b9788feea877827e01e4008a59bafa7800f70adb1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.1/popcraft-0.43.1-linux-arm64.tar.gz"
      sha256 "cafcce5412890a918b4bba0c2917955c189830f126c6404d498b3cbeac138240"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.43.1/popcraft-0.43.1-linux-x64.tar.gz"
      sha256 "ddb895789bf44bce9978cd027cbb2a6b772f8d6e312c21fb2d8379599ba94ecf"
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
