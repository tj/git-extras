from testpath import MockCommand, modified_env

UNKNOWN_SITE_ORIGIN = "https://unknown-site.com/tj/git-extras.git"


def get_file_uri(mode, filename, git):
    commit_hash = git.rev_parse("HEAD")
    if mode == "github":
        return "https://github.com/tj/git-extras/blob/" + commit_hash + "/" + filename
    if mode == "gitlab":
        return "https://gitlab.com/tj/git-extras/-/blob/" + commit_hash + "/" + filename
    if mode == "bitbucket":
        return "https://bitbucket.org/tj/git-extras/src/" + commit_hash + "/" + filename


class TestGitBrowse:
    def test_browse_github_file_on_mac(self, temp_repo):
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with modified_env({"OSTYPE": "darwin"}), MockCommand("open") as openCommand:
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("github", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_on_mac(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with modified_env({"OSTYPE": "darwin"}), MockCommand("open") as openCommand:
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("gitlab", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_on_mac(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with modified_env({"OSTYPE": "darwin"}), MockCommand("open") as openCommand:
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("bitbucket", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_github_file_on_git_bash_on_window(self, temp_repo):
        temp_repo.change_origin_to_github()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with modified_env({"OSTYPE": "msys"}), MockCommand("start") as openCommand:
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("github", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_on_git_bash_on_window(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with modified_env({"OSTYPE": "msys"}), MockCommand("start") as openCommand:
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("gitlab", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_on_git_bash_on_window(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with modified_env({"OSTYPE": "msys"}), MockCommand("start") as openCommand:
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("bitbucket", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_github_file_on_WSL_with_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_github()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "linux"}),
            MockCommand.fixed_output("uname", "microsoft"),
            MockCommand.fixed_output("command", "/powershell.exe"),
            MockCommand("powershell.exe") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("github", filename, git)
            openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_gitlab_file_on_WSL_with_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "linux"}),
            MockCommand.fixed_output("uname", "microsoft"),
            MockCommand.fixed_output("command", "/powershell.exe"),
            MockCommand("powershell.exe") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("gitlab", filename, git)
            openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_bitbucket_file_on_WSL_with_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "linux"}),
            MockCommand.fixed_output("uname", "microsoft"),
            MockCommand.fixed_output("command", "/powershell.exe"),
            MockCommand("powershell.exe") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("bitbucket", filename, git)
            openCommand.assert_called(["-NoProfile", "start", expected_url])

    def test_browse_github_file_on_WSL_without_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_github()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "linux"}),
            MockCommand.fixed_output("uname", "no-micro-soft"),
            MockCommand.fixed_output("command", "/powershell.exe"),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("github", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_on_WSL_without_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "linux"}),
            MockCommand.fixed_output("uname", "no-micro-soft"),
            MockCommand.fixed_output("command", "/powershell.exe"),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("gitlab", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_on_WSL_without_microsoft_key(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "linux"}),
            MockCommand.fixed_output("uname", "no-micro-soft"),
            MockCommand.fixed_output("command", "/powershell.exe"),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("bitbucket", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_github_file_not_mac_or_msys_or_linux(self, temp_repo):
        temp_repo.change_origin_to_github()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("github", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_gitlab_file_not_mac_or_msys_or_linux(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("gitlab", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_bitbucket_file_not_mac_or_msys_or_linux(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename)
            expected_url = get_file_uri("bitbucket", filename, git)
            openCommand.assert_called([expected_url])

    def test_browse_github_file_with_line_number(self, temp_repo):
        temp_repo.change_origin_to_github()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename, "10", "20")
            expected_url = get_file_uri("github", filename, git)
            openCommand.assert_called([expected_url + "#L10-L20"])

    def test_browse_gitlab_file_with_line_number(self, temp_repo):
        temp_repo.change_origin_to_gitlab()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename, "10", "20")
            expected_url = get_file_uri("gitlab", filename, git)
            openCommand.assert_called([expected_url + "#L10-20"])

    def test_browse_bitbucket_file_with_line_number(self, temp_repo):
        temp_repo.change_origin_to_bitbucket()
        git = temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename, "10", "20")
            expected_url = get_file_uri("bitbucket", filename, git)
            openCommand.assert_called([expected_url + "#lines-10:20"])

    def test_browse_unknown_site_file(self, temp_repo):
        temp_repo.change_origin(UNKNOWN_SITE_ORIGIN)
        temp_repo.get_repo_git()
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin")
            openCommand.assert_called([UNKNOWN_SITE_ORIGIN[0:-4]])

    def test_browse_unknown_site_file_with_line_number(self, temp_repo):
        temp_repo.get_repo_git()
        filename = temp_repo.get_filename(0)
        with (
            modified_env({"OSTYPE": "unique-system"}),
            MockCommand("xdg-open") as openCommand,
        ):
            temp_repo.invoke_extras_command("browse", "origin", filename, "10", "20")
            openCommand.assert_called([UNKNOWN_SITE_ORIGIN[0:-4]])
