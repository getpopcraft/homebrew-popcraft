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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.7/popcraft-0.60.7-darwin-arm64.tar.gz"
      sha256 "acfe22478f79bf732e3171d2d156da488ea00ad84b25bd850a7af251ddf090f4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.7/popcraft-0.60.7-darwin-x64.tar.gz"
      sha256 "e00d46060e230544bd2110e09dee316b16f680b754c3a8fe379c1f8c3df59c41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.7/popcraft-0.60.7-linux-arm64.tar.gz"
      sha256 "af95eac210a458094d842dba7d8286d846d0c69ea49990e149922abb3cf4a39b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.7/popcraft-0.60.7-linux-x64.tar.gz"
      sha256 "f1dc8fe8774128b1dc819523b44a70183028833d57f6545e21ea676fb4766340"
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
