import os, subprocess
from testpath import MockCommand, modified_env

UNKNOWN_SITE_ORIGIN = "https://unknown-site.com/tj/git-extras.git"

def get_ci_uri_by_domain(mode):
    if mode == "github":
        return "https://github.com/tj/git-extras/actions"
    if mode == "gitlab":
        return "https://gitlab.com/tj/git-extras/-/pipelines"
    if mode == "bitbucket":
        return "https://bitbucket.org/tj/git-extras/addon/pipelines/home"

class TestGitBrowse:
    def test_browse_github_ci_on_mac(self, temp_repo):
        with modified_env({ "OSTYPE": "darwin" }), MockCommand("open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("github")
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_on_mac(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        with modified_env({ "OSTYPE": "darwin" }), MockCommand("open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("gitlab")
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_on_mac(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        with modified_env({ "OSTYPE": "darwin" }), MockCommand("open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("bitbucket")
            openCommand.assert_called([expected_url])

    def test_browse_github_ci_on_git_bash_on_window(self, temp_repo):
        temp_repo.change_origin_to_github()
        with modified_env({ "OSTYPE": "msys" }), MockCommand("start") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("github")
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_on_git_bash_on_window(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        with modified_env({ "OSTYPE": "msys" }), MockCommand("start") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("gitlab")
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_on_git_bash_on_window(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        with modified_env({ "OSTYPE": "msys" }), MockCommand("start") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("bitbucket")
            openCommand.assert_called([expected_url])

    def test_browse_github_ci_on_WSL_with_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_github()
        with modified_env({ "OSTYPE": "linux" }), MockCommand.fixed_output("uname", "microsoft"), \
            MockCommand.fixed_output("command", "/powershell.exe"), MockCommand("powershell.exe") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("github")
            openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_gitlab_ci_on_WSL_with_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        with modified_env({ "OSTYPE": "linux" }), MockCommand.fixed_output("uname", "microsoft"), \
            MockCommand.fixed_output("command", "/powershell.exe"), MockCommand("powershell.exe") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("gitlab")
            openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_bitbucket_ci_on_WSL_with_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        with modified_env({ "OSTYPE": "linux" }), MockCommand.fixed_output("uname", "microsoft"), \
            MockCommand.fixed_output("command", "/powershell.exe"), MockCommand("powershell.exe") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("bitbucket")
            openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_github_ci_on_WSL_without_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_github()
        with modified_env({ "OSTYPE": "linux" }), MockCommand.fixed_output("uname", "no-micro-soft"), \
            MockCommand.fixed_output("command", "/powershell.exe"), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("github")
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_on_WSL_without_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        with modified_env({ "OSTYPE": "linux" }), MockCommand.fixed_output("uname", "no-micro-soft"), \
            MockCommand.fixed_output("command", "/powershell.exe"), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("gitlab")
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_on_WSL_without_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        with modified_env({ "OSTYPE": "linux" }), MockCommand.fixed_output("uname", "no-micro-soft"), \
            MockCommand.fixed_output("command", "/powershell.exe"), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("bitbucket")
            openCommand.assert_called([expected_url])

    def test_browse_github_ci_not_mac_or_msys_or_linux(self, temp_repo):
        temp_repo.change_origin_to_github()
        with modified_env({ "OSTYPE": "unique-system" }), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("github")
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_ci_not_mac_or_msys_or_linux(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        with modified_env({ "OSTYPE": "unique-system" }), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("gitlab")
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_ci_not_mac_or_msys_or_linux(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        with modified_env({ "OSTYPE": "unique-system" }), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            expected_url = get_ci_uri_by_domain("bitbucket")
            openCommand.assert_called([expected_url])

    def test_browse_unknown_site_file(self, temp_repo):
        temp_repo.change_origin(UNKNOWN_SITE_ORIGIN)
        with modified_env({ "OSTYPE": "unique-system" }), MockCommand("xdg-open") as openCommand:
            temp_repo.invoke_extras_command("browse-ci", "origin")
            openCommand.assert_called([''])
