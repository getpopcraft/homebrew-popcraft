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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.4/popcraft-0.63.4-darwin-arm64.tar.gz"
      sha256 "c456e91d89255814913a62d04feb6319c465f456d0edbe79e37638ee7ea38f25"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.4/popcraft-0.63.4-darwin-x64.tar.gz"
      sha256 "95cfcdf31432c39cc166f85fe52a96cc297e7d7755b052d26b3068a643ace229"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.4/popcraft-0.63.4-linux-arm64.tar.gz"
      sha256 "dbc2c079fb5bbfed69b7a6406353611f215dea734a5160675b07eb4cf3a35373"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.63.4/popcraft-0.63.4-linux-x64.tar.gz"
      sha256 "e013f22d60227c773af8c672c3de2684714d91fbff45924ece8b7297308a9c87"
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
