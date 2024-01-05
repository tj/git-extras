import os, subprocess
from testpath import MockCommand, modified_env

github_origin = "https://github.com/tj/git-extras"
gitlab_origin = "https://gitlab.com/tj/git-extras"
bitbucket_origin = "https://bitbucket.org/tj/git-extras"
unknown_site_origin = "https://unknown-site.com/tj/git-extras"

def set_origin_url(git, url):
    git.remote("set-url", "origin", url + ".git")

def create_expected_filename(git, origin, mode, filename):
    commit_hash = git.rev_parse("HEAD")
    connector = ""
    if mode == "github":
        connector = "/blob/"
    if mode == "gitlab":
        connector = "/-/blob/"
    if mode == "bitbucket":
        connector = "/src/"
    return origin + connector + commit_hash + filename

class TestGitBrowse:
    def test_browse_github_file_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.remote("add", "origin", github_origin + ".git")
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "darwin" }):
            with MockCommand("open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, github_origin, "github", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "darwin" }):
            with MockCommand("open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, gitlab_origin, "gitlab", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "darwin" }):
            with MockCommand("open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, bitbucket_origin, "bitbucket", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_github_file_on_git_bash_on_window(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "msys" }):
            with MockCommand("start") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, github_origin, "github", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_on_git_bash_on_window(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "msys" }):
            with MockCommand("start") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, gitlab_origin, "gitlab", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_on_git_bash_on_window(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "msys" }):
            with MockCommand("start") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, bitbucket_origin, "bitbucket", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_github_file_on_WSL_with_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "microsoft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("powershell.exe") as openCommand:
                        temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                        expected_url = create_expected_filename(git, github_origin, "github", tmp_file)
                        openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_gitlab_file_on_WSL_with_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "microsoft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("powershell.exe") as openCommand:
                        temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                        expected_url = create_expected_filename(git, gitlab_origin, "gitlab", tmp_file)
                        openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_bitbucket_file_on_WSL_with_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "microsoft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("powershell.exe") as openCommand:
                        temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                        expected_url = create_expected_filename(git, bitbucket_origin, "bitbucket", tmp_file)
                        openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_github_file_on_WSL_without_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "no-micro-soft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("xdg-open") as openCommand:
                        temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                        expected_url = create_expected_filename(git, github_origin, "github", tmp_file)
                        openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_on_WSL_without_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "no-micro-soft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("xdg-open") as openCommand:
                        temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                        expected_url = create_expected_filename(git, gitlab_origin, "gitlab", tmp_file)
                        openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_on_WSL_without_microsoft_key(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "linux" }):
            with MockCommand.fixed_output("uname", "no-micro-soft"):
                with MockCommand.fixed_output("command", "/powershell.exe"):
                    with MockCommand("xdg-open") as openCommand:
                        temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                        expected_url = create_expected_filename(git, bitbucket_origin, "bitbucket", tmp_file)
                        openCommand.assert_called([expected_url])

    def test_browse_github_file_not_mac_or_msys_or_linux(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, github_origin, "github", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_not_mac_or_msys_or_linux(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, gitlab_origin, "gitlab", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_not_mac_or_msys_or_linux(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:])
                expected_url = create_expected_filename(git, bitbucket_origin, "bitbucket", tmp_file)
                openCommand.assert_called([expected_url])

    def test_browse_github_file_with_line_number(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, github_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:], "10", "20")
                expected_url = create_expected_filename(git, github_origin, "github", tmp_file)
                openCommand.assert_called([expected_url + "#L10-20"])

    def test_browse_gitlab_file_with_line_number(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, gitlab_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:], "10", "20")
                expected_url = create_expected_filename(git, gitlab_origin, "gitlab", tmp_file)
                openCommand.assert_called([expected_url + "#L10-20"])

    def test_browse_github_file_with_line_number(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, bitbucket_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:], "10", "20")
                expected_url = create_expected_filename(git, bitbucket_origin, "bitbucket", tmp_file)
                openCommand.assert_called([expected_url + "#lines-10:20"])

    def test_browse_unknown_site_file(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, unknown_site_origin)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin")
                openCommand.assert_called([unknown_site_origin])

    def test_browse_unknown_site_file_with_line_number(self, temp_repo):
        git = temp_repo.get_repo_git()
        set_origin_url(git, unknown_site_origin)
        tmp_file = temp_repo.get_file(0)
        with modified_env({ "OSTYPE": "unique-system" }):
            with MockCommand("xdg-open") as openCommand:
                temp_repo.invoke_extras_command("browse", "origin", tmp_file[1:], "10", "20")
                openCommand.assert_called([unknown_site_origin])
