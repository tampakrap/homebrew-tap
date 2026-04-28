class CrossplaneAT20 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "2.0.8"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "d9c499c5f80df31fe59b970ec379f173fd4926ac555a69dffe7c8955e06b7968"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "1d136f96616e5b90fcdc86bf706fcc94d202fcadc1b25b61591f143b2df1add4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "4a34ec1c19ddf9ea77edc9027912ad6334f5e3df8e5b71dcc57ee94263c88da7"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "bb2d7ff9824799541ab3327ac3786250e6ae75480846ff26480ae371d1c9a81e"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "b19988126dd8a3833369ffe263b0465003efa81e2e493f22738a1d66fc84bf01"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    assert_match "Client Version: v#{version}", shell_output("#{bin}/crossplane version --client")
  end
end
