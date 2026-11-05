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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.5/popcraft-0.60.5-darwin-arm64.tar.gz"
      sha256 "eaf2fe31994ee74f391e8e40fc4b1300ebc94a8c26529ba7cd2dbc17b57192fc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.5/popcraft-0.60.5-darwin-x64.tar.gz"
      sha256 "ba247d3774278f4638e03d74aa9c7e63be4c48ce22a6fc678373134c1e6d22ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.5/popcraft-0.60.5-linux-arm64.tar.gz"
      sha256 "28009451577069e88c53ab88b4ba6d41b5cb3bef94e9c833a1cb74004fe725b0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.60.5/popcraft-0.60.5-linux-x64.tar.gz"
      sha256 "c8d35556101563aa95e49473c62b59ec793dbdf5c72cfe2248a2cbd2f56577e0"
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
