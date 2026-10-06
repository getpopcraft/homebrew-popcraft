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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.4/popcraft-0.8.4-darwin-arm64.tar.gz"
      sha256 "87af8430776044bb9ccf5aa3cbe495f37dfacdd06783bfdac4d0243c58166eb6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.4/popcraft-0.8.4-darwin-x64.tar.gz"
      sha256 "81979680c0a9c6c5f40b8292948e1ede11459fb667cc2b800f8507b6944e9468"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.4/popcraft-0.8.4-linux-arm64.tar.gz"
      sha256 "8c8c9612179654403baacfbe2788641c784b56ddffd8c559dfa65b88f8119821"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.4/popcraft-0.8.4-linux-x64.tar.gz"
      sha256 "b0ba900a764ef947f2a66b2175ea395e21cb710f65b39e4e3a8b95666c782ab5"
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
