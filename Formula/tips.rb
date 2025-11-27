class Tips < Formula
  desc "Tips gives you fast explanations for commands. Simply."
  homepage "https://github.com/theFranco2/homebrew-tips"
  url "https://github.com/theFranco2/homebrew-tips/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "BSD-2-Clause"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/tips")
  end
end
