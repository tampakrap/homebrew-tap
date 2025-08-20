class CrossplaneAT116 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.16.5"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bin/darwin_amd64/crank"
    sha256 "302f5f8c7ae90e70580ae16f1ddcc234c6c0c9becb8393a6bfde8813e98004e9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bin/darwin_arm64/crank"
    sha256 "b67565e7b366f396f71a45b36329dbbdcab2a4383400649ed461cca264886ddc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_amd64/crank"
    sha256 "151f8b16ee6bd4093d19a438a556f65e13fe4f4ed54ec1a74e90e485c30ae05e"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_arm/crank"
    sha256 "73e831aa19733c48ee1a57ecff5779cc0226c0c167d0c412198ad77069706de2"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_arm64/crank"
    sha256 "e7a2075bf2256d30afe8ac20b98b0e2fa64986375ba186e4d0886c03487423e4"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
