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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.1/popcraft-0.35.1-darwin-arm64.tar.gz"
      sha256 "a62a047f0da33c369a1a8ed963e87cc819dd67f1c1429071ce389eb971d23eee"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.1/popcraft-0.35.1-darwin-x64.tar.gz"
      sha256 "2384f72750ccd35dfeda75fee78aadb5e283d83c5df96b46f9e297ef7e11d5b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.1/popcraft-0.35.1-linux-arm64.tar.gz"
      sha256 "fb70b167b805194d75e8eb58f1582f1379e4b144414546a8f2e0521728c3f3d2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.35.1/popcraft-0.35.1-linux-x64.tar.gz"
      sha256 "07b59ae425560a1d2ddb11a6c918a45f09f32ca75eb2ff33c4ab5ca0bd174d2e"
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
