# typed: false
# frozen_string_literal: true

# Installs the `popcraft` command line (@popcraft/cli from npm).
class Popcraft < Formula
  desc "Command-line for PopCraft: edit .popcraft files, call the API, publish plugins"
  homepage "https://popcraft.app/docs/api/cli"
  url "https://registry.npmjs.org/@popcraft/cli/-/cli-0.6.0.tgz"
  sha256 "943a1a61cd05ae91c108d09681e2cf5dbea8e1092005e7262a9f68eef7957efb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/popcraft --version").strip
  end
end
