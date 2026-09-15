class CrossplaneAT24 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.4.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crossplane-cli.tar.gz"
    sha256 "9f69ee58321e2194fe48424cf1545a73a5d745fdd1a182a1d08fbcbd4a7703c0"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crossplane-cli.tar.gz"
    sha256 "8aba092ae6bdca9c219588331a607ce921ba50ba4d3cdb5c4676fdeb584e2628"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/linux_amd64/crossplane-cli.tar.gz"
    sha256 "d533f5475aa1ea94f147b9abc0eda0c9575b4599cdc62f7ef25e496f2629fa07"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/linux_arm/crossplane-cli.tar.gz"
    sha256 "99f071d5556ce08b291d50fdc149b8931f699fd6e6ca3b24e9341f98ceb0adf7"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://cli.crossplane.io/stable/v#{version}/bundle/linux_arm64/crossplane-cli.tar.gz"
    sha256 "69efd3c4d81ffa9535334c656bbd4756a5750900df877422f3e3d2dfe82d1c0f"
  end

  def install
    bin.install "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
