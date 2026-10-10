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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.21.0/popcraft-0.21.0-darwin-arm64.tar.gz"
      sha256 "b8f833dd06cc1f4e34aafe1de3fdac69355f63dacedbd4442d6916a4eed4cb3e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.21.0/popcraft-0.21.0-darwin-x64.tar.gz"
      sha256 "908e9e0c703e048e10d930c54c256e8633d79977d65608a9c4ce17f1aa96a7f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.21.0/popcraft-0.21.0-linux-arm64.tar.gz"
      sha256 "aa3b1b986b9f74c8dd575ffc62eba8c86caaf0187425691a1b228baa72d75aea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.21.0/popcraft-0.21.0-linux-x64.tar.gz"
      sha256 "b22ab9c885a97f8381463659787e660e70081897d4f189371a0f58a0a7d3000e"
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
