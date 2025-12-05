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
    venv.pip_install "click>=8.0"
    venv.pip_install "rich>=13.0"
    venv.pip_install "pydantic>=2.0"
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match "triform", shell_output("#{bin}/triform --help")
  end
end
