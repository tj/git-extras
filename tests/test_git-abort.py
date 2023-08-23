class TestGitAbort:
    def test_cherry_pick(self, git_repo):
        print(git_repo)
        assert 1 == 2

    def test_merge(self, git_repo):
        assert 2 == 3

    def test_rebase(self):
        assert 3 == 4

    def test_revert(self):
        assert 4 == 4
