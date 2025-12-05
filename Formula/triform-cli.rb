class TriformCli < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to sync and execute Triform projects"
  homepage "https://triform.ai"
  url "https://files.pythonhosted.org/packages/source/t/triform-cli/triform_cli-0.1.0.tar.gz"
  sha256 "c528521a0b96b4b059fa7f63f1336ff0320291c266a84821edf1e943864b2853"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Install all dependencies including transitive ones
    venv.pip_install "triform-cli"
  end

  test do
    assert_match "triform", shell_output("#{bin}/triform --help")
  end
end
