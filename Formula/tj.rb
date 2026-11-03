class Tj < Formula
  desc "Jump between tmux sessions, most recently used first"
  homepage "https://github.com/aladagemre/tj"
  url "https://github.com/aladagemre/tj/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6113289c982c47174d71f6cf56a589e8e542364606556c874d5d63b66a7f1eec"
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
