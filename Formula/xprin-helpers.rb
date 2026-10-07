class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.4.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "3a9081dd52178b8ff400ccfe4c18a30ec37ae08fc0c3990a34ecf2cab3e677c5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "53cba5897c0b4c41167db712f27b2defa8f38d7cc5c95e60553ab1b75f722455"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "0144efcc27265b287443b661deeee6e06b7a003983f23adbde906aaaf1ee79f1"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "fc0fcb620a976b0fe2361a5d0687d71a0954a5bb4cb8432b04f32cb31982112c"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "fb41663d79d839218893df939627891a29f585c268056d7f00f3a8128604266e"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin-helpers version")
  end
end
