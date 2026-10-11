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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.0/popcraft-0.23.0-darwin-arm64.tar.gz"
      sha256 "59db5f391924b1477b9be0778b425eeae3cac00d2c06424597ac8a50f2436da8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.0/popcraft-0.23.0-darwin-x64.tar.gz"
      sha256 "b1fd1b4c1d63f76deca75a83dae6c226e47aaa222b0a5776bd3e7a924661ced9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.0/popcraft-0.23.0-linux-arm64.tar.gz"
      sha256 "16c8c905bbe27d4a0c6a1a5c6057610aa6d21b8f26d1ba77fc9c1e2df3ac3839"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.23.0/popcraft-0.23.0-linux-x64.tar.gz"
      sha256 "ce10cdeae92e735caaa5c0b8def11a1cd35ad148284f615ba94c8e72b7b499ab"
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
