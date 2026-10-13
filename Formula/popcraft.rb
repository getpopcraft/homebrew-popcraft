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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.3/popcraft-0.40.3-darwin-arm64.tar.gz"
      sha256 "cf9e10fbb238704855532bdc5bbf9326c14bc6888e0f45f5a6fa07670fa261a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.3/popcraft-0.40.3-darwin-x64.tar.gz"
      sha256 "35bb7be2001d805cdc310fc55e05c8ba5aa4d7ba48f29ca377c372e6e7fff503"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.3/popcraft-0.40.3-linux-arm64.tar.gz"
      sha256 "b32924bdd287d46e85f4b4ebc7be61b071cb417e06a6c9ee387f8c844099fe91"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.3/popcraft-0.40.3-linux-x64.tar.gz"
      sha256 "20b25f0334858137f486dcf14cb401a8fbb9db8320b7fd688123bda7b69cdcf3"
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
