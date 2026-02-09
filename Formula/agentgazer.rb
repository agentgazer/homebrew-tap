class Agentgazer < Formula
  desc "Local-first AI agent observability platform"
  homepage "https://github.com/agentgazer/agentgazer"
  url "https://registry.npmjs.org/@agentgazer/cli/-/cli-0.3.0.tgz"
  sha256 "a79909fbd7fe0907b4e9742e7498d0f3b47ba15e5d3134da78ac6c51b2fb7d10"
  license "Apache-2.0"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def post_install
    ohai "AgentGazer installed! Run 'agentgazer' to get started."
    ohai "First time? Run 'agentgazer onboard' to configure."
  end

  def caveats
    <<~EOS
      AgentGazer stores data in ~/.agentgazer/

      Quick start:
        agentgazer              Launch server + proxy + dashboard
        agentgazer onboard      First-time setup
        agentgazer --help       Show all commands

      Uninstalling via brew will NOT remove your data.
      To remove data: rm -rf ~/.agentgazer/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentgazer version")
  end
end
