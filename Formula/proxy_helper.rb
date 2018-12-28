class ProxyHelper < Formula
  desc "Helper for constructing proxy environment variables"
  homepage "https://github.com/takumaw/proxy_helper"
  url "https://github.com/takumaw/proxy_helper/archive/0.0.3.tar.gz"
  version "0.0.3"
  sha256 "61fbc804155a1743961184a65425c2d45e01d4dc2600d7b8b02db7c2ff1e651a"
  head "https://github.com/takumaw/proxy_helper.git"

  depends_on "automake" => :build
  depends_on "autoconf" => :build

  def install
    system "aclocal"
    system "automake", "--add-missing"
    system "autoconf"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  def caveats; <<~EOS
    proxy_helper has been installed as

      #{HOMEBREW_PREFIX}/opt/proxy_helper/libexec/proxy_helper

    You can enable proxy_helper by adding the following lines to
    your `/etc/profile` and/or `/etc/zprofile`:

      if [ -x #{HOMEBREW_PREFIX}/opt/proxy_helper/libexec/proxy_helper ]; then
        eval `#{HOMEBREW_PREFIX}/opt/proxy_helper/libexec/proxy_helper -s`
      fi
  EOS
  end

  test do
    system "make", "check"
  end
end
