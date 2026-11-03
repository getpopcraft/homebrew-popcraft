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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.2/popcraft-0.59.2-darwin-arm64.tar.gz"
      sha256 "9b14cabd392d356ab4931b15eb47ad409f94757027ac03be3bd88b117f61b718"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.2/popcraft-0.59.2-darwin-x64.tar.gz"
      sha256 "45bd5cce446f22700cf5f0ec4fb03c39cbab37c4fb0b48d008cdaa774a4b6e4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.2/popcraft-0.59.2-linux-arm64.tar.gz"
      sha256 "d2d56090c4af92fdbf078e94966ac31fbe6143241020f14dfd521d5ddd4428ea"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.59.2/popcraft-0.59.2-linux-x64.tar.gz"
      sha256 "9b123d97702b2f63358fbab4b25d571ca6c7772cd11a87d2422d47c88aba1cd1"
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
