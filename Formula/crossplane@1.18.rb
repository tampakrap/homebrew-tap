class CrossplaneAT118 < Formula
  desc "Build control planes without needing to write code"
  homepage "https://crossplane.io"
  version "1.18.5"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_amd64/crank.tar.gz"
    sha256 "e213f1f53cc0fc59c86bd543bab8d336406ca9c2dfc600ca6500c702ab779f9b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/darwin_arm64/crank.tar.gz"
    sha256 "84c802ca7bfb7812360f91556b3fc544ec5959994052de1f3439c2952e4fca45"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_amd64/crank.tar.gz"
    sha256 "737f4d23f01e049faa016ad868844ca3ac22bb2f61cb2369a471599f756cf087"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm/crank.tar.gz"
    sha256 "ca42af3abb25ef2e9c78763e1832299c01cb1a866caa00abb9c93fb58e6aee60"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://releases.crossplane.io/stable/v#{version}/bundle/linux_arm64/crank.tar.gz"
    sha256 "fd6b15d34152447a9114abf59cbc9a5387062ed85bbe79d1d56ec503b59e3499"
  end

  def install
    bin.install "crank" => "crossplane"
  end

  test do
    system "#{bin}/crossplane", "version", "--client"
  end
end
