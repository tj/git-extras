import os, pytest

class TestGitArchiveFile:
    def test_init(self, temp_repo):
        git = temp_repo.get_repo_git()
        tmp_file = temp_repo.get_file(0)
        temp_repo.writefile(tmp_file, "data")
        git.add(".")
        git.commit("-m", "test: add data")
        git.tag("0.1.0", "-m", "bump: 0.1.0")

    def test_archive_file_on_tags_branch(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.checkout("-b", "tags0.1.0")
        temp_repo.invoke_installed_extras_command("archive-file")
        filename = "{0}.{1}.zip".format(temp_repo.get_repo_dirname(), git.describe())
        assert filename in os.listdir()

    def test_archive_file_on_any_not_tags_branch_without_default_branch(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.checkout("-b", "not-tags-branch")
        temp_repo.invoke_installed_extras_command("archive-file")
        filename = "{0}.{1}.{2}.zip".format(
                temp_repo.get_repo_dirname(),
                git.describe("--always", "--long"),
                "not-tags-branch")
        assert filename in os.listdir()

    def test_archive_file_on_any_not_tags_branch_with_default_branch(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.checkout("master")
        git.config("git-extras.default-branch", "master")
        temp_repo.invoke_installed_extras_command("archive-file")
        filename = "{0}.{1}.zip".format(
                temp_repo.get_repo_dirname(),
                git.describe("--always", "--long"))
        assert filename in os.listdir()

    def test_archive_file_on_branch_name_has_slash(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.checkout("-b", "feature/slash")
        temp_repo.invoke_installed_extras_command("archive-file")
        filename = "{0}.{1}.{2}.zip".format(
                temp_repo.get_repo_dirname(),
                git.describe("--always", "--long"),
                "feature-slash")
        assert filename in os.listdir()

    @pytest.mark.parametrize("named_temp_repo", ["backslash\\dir"], indirect=True)
    def test_archive_file_on_dirname_has_backslash(self, named_temp_repo):
        named_temp_repo.invoke_installed_extras_command("archive-file")
        git = named_temp_repo.get_repo_git()
        filename = "{0}.{1}.{2}.zip".format(
                "backslash-dir",
                git.describe("--always", "--long"),
                "master")
        assert filename in os.listdir()

    def test_archive_file_on_tag_name_has_slash(self, temp_repo):
        temp_repo.switch_cwd_under_repo()
        git = temp_repo.get_repo_git()
        git.checkout("master")
        git.tag("--delete", "0.1.0")
        git.tag("0.1.0/slash", "-m", "bump: 0.1.0")
        temp_repo.invoke_installed_extras_command("archive-file")
        description_include_version = git.describe("--always", "--long")
        filename = "{0}.{1}.zip".format(
                temp_repo.get_repo_dirname(),
                description_include_version.replace("/", "-"))
        assert filename in os.listdir()
