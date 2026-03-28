class AerospaceSwipe < Formula
  desc "Touchpad swipe gestures for AeroSpace window manager"
  homepage "https://github.com/0xACE/aerospace-swipe"
  url "https://github.com/0xACE/aerospace-swipe/archive/976c3107f6ed9859149bdc130e3f8928f2ab6852.tar.gz"
  version "unstable-2025-02-04"
  # To get this hash run:
  # curl -sL https://github.com/0xACE/aerospace-swipe/archive/976c3107f6ed9859149bdc130e3f8928f2ab6852.tar.gz | shasum -a 256
  sha256 "22fb45680d2df32f09519ebb0616051eb4e9a78f30549f910193066504393f6c"

  def install
    inreplace "src/haptic.c", "kIOMainPortDefault", "kIOMasterPortDefault"
    system "make", "all"
    system "/usr/bin/codesign", "--entitlements", "accessibility.entitlements", "--sign", "-", "swipe"
    bin.install "swipe" => "aerospace-swipe"
  end
end
