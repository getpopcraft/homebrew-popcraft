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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.0/popcraft-0.24.0-darwin-arm64.tar.gz"
      sha256 "77295e9e6cd91cdbcb57b057afbc1198ec567f8d6a3eae87b5dc428007152e91"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.0/popcraft-0.24.0-darwin-x64.tar.gz"
      sha256 "015caa06375b321bbc44893b609249d1c86cc6b17e8a942ece2e6fa9907b2907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.0/popcraft-0.24.0-linux-arm64.tar.gz"
      sha256 "4f79aade604ea2871ef6ef419d929d8fa7d3f09696834bc1ca25efbef021d9c5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.24.0/popcraft-0.24.0-linux-x64.tar.gz"
      sha256 "4d514fa5a25a1edef8213cec4e29d9415807fd7bfd0a9878a48f9f6a9dc65afc"
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
