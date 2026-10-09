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
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.2/popcraft-0.13.2-darwin-arm64.tar.gz"
      sha256 "e1d8a20e4cdad529c59f501169f89b9d21358b93556cea16e821c3d02414f86b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.2/popcraft-0.13.2-darwin-x64.tar.gz"
      sha256 "6aba89bf1440e2836fef93f8d768d991ffbdd627f9fd31dd20318d755fea36d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.2/popcraft-0.13.2-linux-arm64.tar.gz"
      sha256 "5105c2691c39469db8f06829ddeb569f359fd46d15a59e4a0edb57860b3abcb3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/getpopcraft/homebrew-popcraft/releases/download/v0.13.2/popcraft-0.13.2-linux-x64.tar.gz"
      sha256 "190a7bd9936ebd62241c177eaa60863edd639f5f5091b3d98eab158bcc4f43b3"
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
