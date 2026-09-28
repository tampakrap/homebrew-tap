class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.3.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "735a1c7e79589dd78a507d0ecac487dd2979e4f541aedf3df2b9cc2424f66807"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "05b4c21633969748702d614a6adad683097e589d8cd7aa5089ac9e8fcf2a5508"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "38a1711f743a9a8a8b3034430a6e9aa647ea7a491a9a5cd8da71c9750c0bd4fd"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "7136bf7846b14af49d120cc4d69e001ecd192a979908e9a1f6296b7e675257ee"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "9eafec76023aa3c483d8f929b458379b2ae1ea07c351e693246bd06f025edf6e"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin-helpers version")
  end
end
