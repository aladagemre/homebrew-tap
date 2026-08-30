class Tj < Formula
  desc "Jump between tmux sessions, most recently used first"
  homepage "https://github.com/aladagemre/tj"
  url "https://github.com/aladagemre/tj/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f5470e6f2386a19ff0ff7e5c41bd193ed7a1774f78d2d1bcb726ea391a5dd443"
  license "MIT"
  head "https://github.com/aladagemre/tj.git", branch: "main"

  depends_on "fzf"
  depends_on "tmux"

  def install
    bin.install "tj"
  end

  def caveats
    <<~EOS
      Bind the picker to prefix + j by adding this to ~/.tmux.conf:

        bind j display-popup -E -w 80% -h 75% "#{opt_bin}/tj"

      Then reload with: tmux source-file ~/.tmux.conf
    EOS
  end

  test do
    assert_match "tj #{version}", shell_output("#{bin}/tj --version")
  end
end
