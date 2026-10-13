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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.41.0/popcraft-0.41.0-darwin-arm64.tar.gz"
      sha256 "cd9e77be0f3daf7e814b456863d059284cc5537211358d386a4185e7afa74373"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.41.0/popcraft-0.41.0-darwin-x64.tar.gz"
      sha256 "d6a7fd76a9bd996004c1b8e5562435480f8633a295c769ae628ccae5b94f90d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.41.0/popcraft-0.41.0-linux-arm64.tar.gz"
      sha256 "aa46b59507fe4a7730444bbc700e8b1bba1ab44620f264486630857b6b72f673"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.41.0/popcraft-0.41.0-linux-x64.tar.gz"
      sha256 "510f521400a4f82a3dd1bf27158ab319c32c695e28de6bc53c3e6808b74e4a93"
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
