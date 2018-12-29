class ProxyHelper < Formula
  desc "Helper for constructing proxy environment variables"
  homepage "https://github.com/takumaw/proxy_helper"
  url "https://github.com/takumaw/proxy_helper/archive/0.0.4.tar.gz"
  version "0.0.4"
  sha256 "ec26ca9680996450ee828a3160411a73cdf710e9615027d7858a48c80275f2db"
  head "https://github.com/takumaw/proxy_helper.git"

  depends_on "automake" => :build
  depends_on "autoconf" => :build

  def install
    system "aclocal"
    system "automake", "--add-missing"
    system "autoconf"
    system "./configure", "--prefix=#{prefix}"
    system "env", "SWIFTBBUILDFLAGS=--disable-sandbox", "make", "install"
  end

  def caveats; <<~EOS
    proxy_helper has been installed at

      #{HOMEBREW_PREFIX}/opt/proxy_helper/libexec/proxy_helper

    You can enable proxy_helper by adding the following code snippet to
    your `/etc/profile` for BASH, or `/etc/zprofile` for ZSH:

      if [ -x #{HOMEBREW_PREFIX}/opt/proxy_helper/libexec/proxy_helper ]; then
          eval `#{HOMEBREW_PREFIX}/opt/proxy_helper/libexec/proxy_helper -s`
      fi
  EOS
  end

  test do
    system "make", "check"
  end
end
