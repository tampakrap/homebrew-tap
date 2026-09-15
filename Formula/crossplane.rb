class Crossplane < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.3.4"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crossplane-cli.tar.gz"
    sha256 "919fa58a1c70a0139b58a60be696d1bfb4bf75908fa5638dec2e57300311d466"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crossplane-cli.tar.gz"
    sha256 "58b4e36a98685c72285cda267b6c0f5f8bf07d8381a8f8616fe2af20cc085519"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/linux_amd64/crossplane-cli.tar.gz"
    sha256 "98afad400cd355b9364a702c69d9c33d639606a660c82e5d01ae66742c5cf7b7"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/linux_arm/crossplane-cli.tar.gz"
    sha256 "51abf5da949fbdec8287f970e52f9ea9c3070dff7741f5ec44d44e8340f31e8e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/linux_arm64/crossplane-cli.tar.gz"
    sha256 "d16e8c4d8af78751edb39e75b1c46b7164e1bdee0659a75e54ceb3262764a178"
  end

  def install
    bin.install "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
