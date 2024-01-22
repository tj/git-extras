import os, subprocess
from testpath import MockCommand, modified_env

github_origin = "https://github.com/tj/git-extras"
gitlab_origin = "https://gitlab.com/tj/git-extras"
bitbucket_origin = "https://bitbucket.org/tj/git-extras"
unknown_site_origin = "https://unknown-site.com/tj/git-extras"

def set_origin_url(git, url):
    git.remote("set-url", "origin", url + ".git")

def create_expected_action_url(git, mode):
    if mode == "github":
        return github_origin + '/actions'
    if mode == "gitlab":
        return gitlab_origin + '/-/pipelines'
    if mode == "bitbucket":
        return bitbucket_origin + '/addon/pipelines/home'

class TestGitBrowse:
    def test_browse_github_ci_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.remote("add", "origin", github_origin + ".git")
        with modified_env({ "OSTYPE": "darwin" }):
            with MockCommand("open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "github")
                openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        with modified_env({ "OSTYPE": "darwin" }):
            with MockCommand("open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "gitlab")
                openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        with modified_env({ "OSTYPE": "darwin" }):
            with MockCommand("open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "bitbucket")
                openCommand.assert_called([expected_url])

    def test_browse_github_ci_on_git_bash_on_window(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        with modified_env({ "OSTYPE": "msys" }):
            with MockCommand("start") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "github")
                openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_on_git_bash_on_window(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        with modified_env({ "OSTYPE": "msys" }):
            with MockCommand("start") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "gitlab")
                openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_on_git_bash_on_window(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        with modified_env({ "OSTYPE": "msys" }):
            with MockCommand("start") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "bitbucket")
                openCommand.assert_called([expected_url])

    def test_browse_github_ci_on_WSL_with_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "microsoft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("powershell.exe") as openCommand:
                        temp_repo.invoke_extras_command("browse-ci", "origin")
                        expected_url = create_expected_action_url(git, "github")
                        openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_gitlab_ci_on_WSL_with_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "microsoft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("powershell.exe") as openCommand:
                        temp_repo.invoke_extras_command("browse-ci", "origin")
                        expected_url = create_expected_action_url(git, "gitlab")
                        openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_bitbucket_ci_on_WSL_with_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "microsoft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("powershell.exe") as openCommand:
                        temp_repo.invoke_extras_command("browse-ci", "origin")
                        expected_url = create_expected_action_url(git, "bitbucket")
                        openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_github_ci_on_WSL_without_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "no-micro-soft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("xdg-open") as openCommand:
                        temp_repo.invoke_extras_command("browse-ci", "origin")
                        expected_url = create_expected_action_url(git, "github")
                        openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_on_WSL_without_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "no-micro-soft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("xdg-open") as openCommand:
                        temp_repo.invoke_extras_command("browse-ci", "origin")
                        expected_url = create_expected_action_url(git, "gitlab")
                        openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_on_WSL_without_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "no-micro-soft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("xdg-open") as openCommand:
                        temp_repo.invoke_extras_command("browse-ci", "origin")
                        expected_url = create_expected_action_url(git, "bitbucket")
                        openCommand.assert_called([expected_url])

    def test_browse_github_ci_not_mac_or_msys_or_linux(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "github")
                openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_not_mac_or_msys_or_linux(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "gitlab")
                openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_not_mac_or_msys_or_linux(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                expected_url = create_expected_action_url(git, "bitbucket")
                openCommand.assert_called([expected_url])

    def test_browse_unknown_site_file(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, unknown_site_origin)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse-ci", "origin")
                openCommand.assert_called([''])
