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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.5/popcraft-0.8.5-darwin-arm64.tar.gz"
      sha256 "e03bf25c2cea10e957a873249e6f72ce303a723e919a9d385f9f3f01e2818b92"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.5/popcraft-0.8.5-darwin-x64.tar.gz"
      sha256 "06490d66f531e94df5e0dabb5e7e5e4cb04613e6155ac080db9c31189329edd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.5/popcraft-0.8.5-linux-arm64.tar.gz"
      sha256 "9da545a5d688a9eadd8547849e6df3adc5551daa61d80d44ef36509d8de5cd3e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.8.5/popcraft-0.8.5-linux-x64.tar.gz"
      sha256 "8e2af0a3ce6aca0b1abf3a76ecd6a7acc9add6fa6dff5d837e438276c318a9c6"
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
