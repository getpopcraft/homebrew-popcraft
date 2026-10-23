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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.3/popcraft-0.53.3-darwin-arm64.tar.gz"
      sha256 "7419a1662b382ddb7a06a7e47d1cebd53efa899492119c0c926eb0503abfe76f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.3/popcraft-0.53.3-darwin-x64.tar.gz"
      sha256 "aa0c812f6f161db2ec71e70cf0a9dc43204d109979bb4940c490fbdf56b565bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.3/popcraft-0.53.3-linux-arm64.tar.gz"
      sha256 "db74cadde2039726a322d951e7422f9fa55bd3322878e5eef315d25544346220"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.53.3/popcraft-0.53.3-linux-x64.tar.gz"
      sha256 "1bdbeb38f039665e10cfd4e22db3002b0e5f471bfcb6baf78ac9537242310cb4"
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
