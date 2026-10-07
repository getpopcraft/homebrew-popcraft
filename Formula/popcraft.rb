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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.2/popcraft-0.9.2-darwin-arm64.tar.gz"
      sha256 "6da715ed43115a7a4f777ce02c997be1683f7b1cc7e2b8cb2fc9c70d9299f29e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.2/popcraft-0.9.2-darwin-x64.tar.gz"
      sha256 "27f600db627d6af65e31c0023b4c989574709870c536da758eb2095cd88b9ecf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.2/popcraft-0.9.2-linux-arm64.tar.gz"
      sha256 "0a034065247710ee9a066428c4fb7735700459997a52c95ef4dfe766ed22a708"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.2/popcraft-0.9.2-linux-x64.tar.gz"
      sha256 "7368af400e7a9cbc9e7426d12334f8e4469de0fe4be5ddd17695d5440b65b651"
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
