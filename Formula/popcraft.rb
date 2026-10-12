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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.3/popcraft-0.38.3-darwin-arm64.tar.gz"
      sha256 "4b2afd68bb1bcc660699917401ee665568942fa3316e74b6c47fdeca592b5fa6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.3/popcraft-0.38.3-darwin-x64.tar.gz"
      sha256 "2296fe9c9d7b22e2e1703f495e13a83db538a20b37721cd920d32ffc2d630b96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.3/popcraft-0.38.3-linux-arm64.tar.gz"
      sha256 "9f4e8b4ab9c833e24f3c907c88e07be37b225e200e664bed36a2328966aac502"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.38.3/popcraft-0.38.3-linux-x64.tar.gz"
      sha256 "159a3d1d12d83cc89a75613b01e162390b66b8f24505e6b283ebc7d66b9523d0"
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
