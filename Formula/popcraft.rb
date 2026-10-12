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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.6/popcraft-0.38.6-darwin-arm64.tar.gz"
      sha256 "6661eefe7fcc58bf47c04fcb6429b04c01b048a1665c7429f8ece2b356efad0c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.6/popcraft-0.38.6-darwin-x64.tar.gz"
      sha256 "a34a98abbec494838f292ffdd741780ae68ed21a0eb44b7a766459ea207eed01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.6/popcraft-0.38.6-linux-arm64.tar.gz"
      sha256 "19fc77a0585db0dec89d3248e540dd331fcf73c3e6a7b06507292e5ee99609a0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.6/popcraft-0.38.6-linux-x64.tar.gz"
      sha256 "5b3d47d3a3114ad8885fa41af02953779559c1925d7242281639a2b385cc2fab"
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
