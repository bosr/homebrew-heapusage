class Heapusage < Formula
  desc "Find memory leaks in Linux and macOS applications"
  homepage "https://github.com/d99kris/heapusage"
  url "https://github.com/d99kris/heapusage/archive/v1.0.tar.gz"
  sha256 "b37585f52c8d6410f33ad0c5808ebb0d47ff0694891d65e4a63c8501c6817af0"
  head "https://github.com/d99kris/heapusage.git"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/heapusage", "env"
  end
end
