from git import GitCommandError

class TestGitAbort:
    def test_init(self, temp_repo):
        git = temp_repo.get_repo_git()
        tmp_file = temp_repo.get_file(0)
        git.branch("A")
        git.branch("B")
        git.checkout("A")
        temp_repo.writefile(tmp_file, "a")
        git.add(".")
        git.commit("-m", "A")
        git.checkout("B")
        temp_repo.writefile(tmp_file, "b")
        git.add(".")
        git.commit("-m", "B")
        git.status()

    def test_cherry_pick(self, temp_repo):
        git = temp_repo.get_repo_git()
        try:
            git.cherry_pick("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        temp_repo.invoke_extras_command("abort")
        result = git.status()
        assert "nothing to commit, working tree clean" in result

    def test_merge(self, temp_repo):
        git = temp_repo.get_repo_git()
        try:
            git.merge("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        temp_repo.invoke_extras_command("abort")
        result = git.status()
        assert "nothing to commit, working tree clean" in result

    def test_rebase(self, temp_repo):
        git = temp_repo.get_repo_git()
        try:
            git.rebase("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        temp_repo.invoke_extras_command("abort")
        result = git.status()
        assert "nothing to commit, working tree clean" in result

    def test_revert(self, temp_repo):
        git = temp_repo.get_repo_git()
        try:
            git.revert("A")
        except GitCommandError as err:
            print(err)
        result = git.status()
        assert "Unmerged path" in result
        temp_repo.invoke_extras_command("abort")
        result = git.status()
        assert "nothing to commit, working tree clean" in result
