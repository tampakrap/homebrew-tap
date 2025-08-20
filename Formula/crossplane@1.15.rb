class CrossplaneAT115 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.15.6"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bin/darwin_amd64/crank"
    sha256 "312bc50b30460fc04bdc8949d41d05e717ac3bf54ef291f6bb1df96655559b8c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bin/darwin_arm64/crank"
    sha256 "efd311c8a7ccf81d4663975bc3180fa18ccc8c93a4a2c0f56e51480a4dba3e35"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_amd64/crank"
    sha256 "dac16d843dbc676786c896590465d9bebd3ad06556c227160aef4616a00541b6"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_arm/crank"
    sha256 "0ac246c582dc9c7f9f5f067b405f49439bbe48b3a466fedf13b1d1797530b794"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bin/linux_arm64/crank"
    sha256 "d77282795260768a765a77c94de9da01be837fbb303cd81596abe1a0bb3619a5"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "--version"
  end
end
