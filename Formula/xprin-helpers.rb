class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.7.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "820d6e7f4e354200ee5d5f319385c1ffa6a56b943f7c2ab55dc10d90135ea270"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "0db840e811357b8602e29c3c9e5c9afcee709a3eaa9ab0c8fd81eb0a57e6ce88"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "f74c75afd8d2c23b751c47aff1a4c559e8c0efa78369cbb95f32ae13018a2592"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "4a060c5c4f15333a59bdc0f5659ffb008dfc988937a28e456d48ceef82a3d651"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "791023642131ea8a2491dc4a76dcf7aecffc0b134016b4488b73917ea90e5b2f"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin-helpers version")
  end
end
