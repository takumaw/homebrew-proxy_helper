class ProxyHelper < Formula
  desc "Helper for constructing proxy environment variables"
  homepage "https://github.com/takumaw/proxy_helper"
  url "https://github.com/takumaw/proxy_helper/releases/download/v0.1.0/proxy_helper-v0.1.0-macOS.tar.gz"
  version "0.1.0"
  sha256 "488f697ca7f53d7bb97d13584e71dd144686dba66a48418573b267756f085fdd"
  head "https://github.com/takumaw/proxy_helper.git"

  def install
    libexec.install "bin/proxy_helper"
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
