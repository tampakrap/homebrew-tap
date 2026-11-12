class Xprin < Formula
  desc "Testing framework for Crossplane"
  homepage "https://github.com/crossplane-contrib/xprin"
  version "0.6.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_amd64.tar.gz"
    sha256 "44dacd2af86200585bceb99705dbea920a6f5d8c0830f6bc08ef28c4cd821c15"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_darwin_arm64.tar.gz"
    sha256 "dd3cf5dcd84e9c509300e02b521e206bca28a15f38f24e82230c03d01f3ebb17"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_amd64.tar.gz"
    sha256 "98117bcb6f5eadbfd5cf312272df4124ebe4d2db5e32be292da9093716006c53"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm.tar.gz"
    sha256 "2cc95796d281d0699164eaa1a2dece132d45ee447fd78b2221a6f67f5188cccf"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/crossplane-contrib/xprin/releases/download/v#{version}/xprin_linux_arm64.tar.gz"
    sha256 "e9a9b96722c3e44a1972680c324f4e6f069b2d341ef9a820766855013633fd2c"
  end

  def install
    bin.install "xprin"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/xprin version")
  end
end
