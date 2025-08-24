class CrossplaneAT119 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.19.3"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "ed5e4abb59ffa9b476624b8785ea9c5506f8376ef184aba7078447f43807c0b8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "3a669f30226a6e56fa7af11a7f8fce34c6f9316c3d00f459d77073b26139dc16"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "7f36b7c8b09525b9b0ce0c060de493aaed84aff1ca5ec9909587721a69aba941"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "abd0199b0b6b417447ec823f0f63290fe5037f9626cef2eabe5605948d36f361"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "8b7e909705897335817bb3429cbf55461e1a1977f6d41dd3a4f4de05b733a8b4"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
