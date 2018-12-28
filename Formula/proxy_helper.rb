class ProxyHelper < Formula
  desc "Helper for constructing proxy environment variables"
  homepage "https://github.com/takumaw/proxy_helper"
  url "https://github.com/takumaw/proxy_helper/archive/0.0.2.tar.gz"
  version "0.0.2"
  sha256 "bf03b4e09722d692ec945cd850001e213fa161bae8f3599b00d943a198acd758"
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
