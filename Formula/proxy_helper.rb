class ProxyHelper < Formula
  desc "Helper for constructing proxy environment variables"
  homepage "https://github.com/takumaw/proxy_helper"
  url "https://github.com/takumaw/proxy_helper/releases/download/v0.2.0/proxy_helper-v0.2.0-macOS.tar.gz"
  version "0.2.0"
  sha256 "7b4ba0da0ec9bbd7fe2c148528b90501edb588b594f2e3e3b441d7db3831523b"
  head "https://github.com/takumaw/proxy_helper.git"

  def install
    libexec.install "libexec/proxy_helper"
    man8.install "share/man/man8/proxy_helper.8"
  end

  def caveats; <<~EOS
    proxy_helper has been installed at

      #{opt_libexec}/proxy_helper

    You can enable proxy_helper by adding the following code snippet to
    your `/etc/profile` for BASH, or `/etc/zprofile` for ZSH:

      if [ -x #{opt_libexec}/proxy_helper ]; then
          eval `#{opt_libexec}/proxy_helper -s`
      fi
  EOS
  end

  test do
    system "#{libexec}/proxy_helper", "-s"
  end
end
