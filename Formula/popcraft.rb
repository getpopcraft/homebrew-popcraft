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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.3/popcraft-0.60.3-darwin-arm64.tar.gz"
      sha256 "365fff3e890a6759e51dc72f83af15210015a1c72e9f0bfef894810818ae8e42"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.3/popcraft-0.60.3-darwin-x64.tar.gz"
      sha256 "17005e356ae3e5d6d85bb41adbc12691c4e75d849c4ef74aca01d72e97037ed8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.3/popcraft-0.60.3-linux-arm64.tar.gz"
      sha256 "6c4a8c31f765d360ff914e09fe2dc47544424f58c7e48eddcac0e07a9ba4c634"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.3/popcraft-0.60.3-linux-x64.tar.gz"
      sha256 "fcf7f5f8bc97fa5485f9e7d223462707f7a69924cfcc0e9a438f9591c62071c8"
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
