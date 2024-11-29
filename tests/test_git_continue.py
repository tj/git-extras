from git import GitCommandError


class TestGitContinue:

    @classmethod
    def _init_repo(cls, repo):
        git = repo.get_repo_git()
        tmp_file = repo.get_file(0)
        git.branch("A")
        git.branch("B")
        git.branch("C")
        git.checkout("A")
        repo.writefile(tmp_file, "a")
        git.add(".")
        git.commit("-m", "A")
        git.checkout("B")
        repo.writefile(tmp_file, "b")
        git.add(".")
        git.commit("-m", "B")

    def test_init(self, temp_repo_clean):
        TestGitContinue._init_repo(temp_repo_clean)
        git = temp_repo_clean.get_repo_git()
        git.status()

    def test_cherry_pick(self, temp_repo_clean):
        TestGitContinue._init_repo(temp_repo_clean)
        git = temp_repo_clean.get_repo_git()
        try:
            git.cherry_pick("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        git.add(".")
        temp_repo_clean.invoke_extras_command("continue")
        result = git.status()
        assert "nothing to commit, working tree clean" in result

    def test_merge(self, temp_repo_clean):
        TestGitContinue._init_repo(temp_repo_clean)
        git = temp_repo_clean.get_repo_git()
        try:
            git.merge("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        git.add(".")
        git.commit("-m", "resolve conflict")
        temp_repo_clean.invoke_extras_command("continue")
        result = git.status()
        assert "nothing to commit, working tree clean" in result

    def test_rebase(self, temp_repo_clean):
        TestGitContinue._init_repo(temp_repo_clean)
        git = temp_repo_clean.get_repo_git()
        try:
            git.rebase("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        git.add(".")
        git.commit("-m", "resolve conflict")
        temp_repo_clean.invoke_extras_command("continue")
        result = git.status()
        assert "nothing to commit, working tree clean" in result

    def test_revert(self, temp_repo_clean):
        TestGitContinue._init_repo(temp_repo_clean)
        git = temp_repo_clean.get_repo_git()
        try:
            git.revert("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        git.add(".")
        git.commit("-m", "resolve conflict")
        temp_repo_clean.invoke_extras_command("continue")
        result = git.status()
        assert "nothing to commit, working tree clean" in result
