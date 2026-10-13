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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.6/popcraft-0.40.6-darwin-arm64.tar.gz"
      sha256 "3c6c0e175f08db89d8d4b520a6a5621c391a163ae5487d2734954a22eec99dbb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.6/popcraft-0.40.6-darwin-x64.tar.gz"
      sha256 "9db36e46135e93bbcdb296dfa6e30af220647159bec323cb242a4ea75929cef0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.6/popcraft-0.40.6-linux-arm64.tar.gz"
      sha256 "9396308c65a683718cbe9dbb5e5f4d6537f4c05a12a7b601382a67f621306900"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.40.6/popcraft-0.40.6-linux-x64.tar.gz"
      sha256 "3119252875d25b4870b61534a9ea9737ae17f29a11ad6de0ec9891e1aeb2f822"
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
