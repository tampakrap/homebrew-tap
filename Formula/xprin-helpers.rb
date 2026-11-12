class XprinHelpers < Formula
  desc "Helper standalone tools used by xprin"
  homepage "https://github.com/crossplane-contrib/xprin/blob/main/docs/xprin-helpers.md"
  version "0.6.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_amd64.tar.gz"
    sha256 "22dd41615e2393b618fb39bf8d3f5404a6b5ba2cce1c91d4dc6f4cf8fd56ee52"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_darwin_arm64.tar.gz"
    sha256 "2294c837901d3d262de09cd8769e0250db388fe48b60f7516c03f6868f374b24"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_amd64.tar.gz"
    sha256 "954f8baeb270686b4453509e331d12d134e9f1c225d32b2580bb61a0dd559dfc"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm.tar.gz"
    sha256 "d528eed35f0539ead4530fe34305ebc36bbc45ec6148ee9676470217c0f0b37f"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin-helpers_linux_arm64.tar.gz"
    sha256 "5d88a2031350507b40a2e6e8cc61c17a4ce062acf5d0ed8c67cdf5473472fb86"
  end

  def install
    bin.install "xprin-helpers"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin-helpers version")
  end
end
