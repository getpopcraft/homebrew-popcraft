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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.8/popcraft-0.9.8-darwin-arm64.tar.gz"
      sha256 "bfb8b5ee1be8f5302443f0b7f9547c559f8b98da029fe8e09c7a585453f0c849"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.8/popcraft-0.9.8-darwin-x64.tar.gz"
      sha256 "9489e690db5b338783594813217e6b5949fa2ed5e4431220d187691aa5f0df01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.8/popcraft-0.9.8-linux-arm64.tar.gz"
      sha256 "23b7b265da2f430619eed44a0c3643d657958a7142a4a31da16da86e621f8f29"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.9.8/popcraft-0.9.8-linux-x64.tar.gz"
      sha256 "64a356dc3a874e9f576e3dc04ebddacb8afdc8a5b601beb5ee6537a2c676e991"
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
