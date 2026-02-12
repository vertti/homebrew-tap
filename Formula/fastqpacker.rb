class Fastqpacker < Formula
  desc "Speed-first FASTQ compressor with block-based parallel compression"
  homepage "https://github.com/vertti/fastqpacker"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vertti/fastqpacker/releases/download/v0.8.0/fqpack-darwin-arm64"
      sha256 "6d2a9a377c4c80339cd381b0892e551dda3a226f8fce9cd7e760443e1573d825"
    else
      url "https://github.com/vertti/fastqpacker/releases/download/v0.8.0/fqpack-darwin-amd64"
      sha256 "1c7b4feb3eb639b77ff18d51660e989e9d2a219c28e2e448d9b753f805288e5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vertti/fastqpacker/releases/download/v0.8.0/fqpack-linux-arm64"
      sha256 "080c4bac5f07dbe72e3d48d1dad73df7ba4314711888731305314fd38289239d"
    else
      url "https://github.com/vertti/fastqpacker/releases/download/v0.8.0/fqpack-linux-amd64"
      sha256 "619ae25bb991e258458b837e722469c4374ff1960d2980945e9c14b1abd69111"
    end
  end

  def install
    binary = Dir["fqpack-*"].first
    bin.install binary => "fqpack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fqpack --version")
  end
end
