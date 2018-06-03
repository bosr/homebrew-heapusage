class Heapusage < Formula
  desc "Find memory leaks in Linux and macOS applications"
  homepage "https://github.com/d99kris/heapusage"
  url "https://github.com/d99kris/heapusage"
  version "1.0"
  sha256 "0de9eb9b83e6118879660bb6561696cbeaee5d77e21b4cc98ebe6b2de1c1d8e8"
  head "https://github.com/d99kris/heapusage.git"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "..", *std_cmake_args
      system "make", "install"
    end
    # system "cmake", "-G", "Unix Makefiles", ".", *std_cmake_args
    # system "make", "install"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test heapusage`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/heapusage", "ruby", "--version"
  end
end
