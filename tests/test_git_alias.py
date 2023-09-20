class TestGitAlias:
    def test_init(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.config("--global", "alias.globalalias", "status")
        git.config("--global", "alias.x", "status")
        git.config("--local", "alias.localalias", "status")
        git.config("--local", "alias.y", "status")

    def test_list_all(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias")
        actual = actual.stdout.decode()
        assert "globalalias = status" in actual
        assert "x = status" in actual
        assert "localalias = status" in actual
        assert "y = status" in actual

    def test_list_all_globally(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias", "--global")
        actual = actual.stdout.decode()
        assert "globalalias = status" in actual

    def test_list_all_locally(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias", "--local")
        actual = actual.stdout.decode()
        assert "localalias = status" in actual

    def test_search_globally(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias", "--global", "global")
        actual = actual.stdout.decode()
        assert "globalalias = status" in actual
        actual = temp_repo.invoke_extras_command("alias", "--global", "local")
        actual = actual.stdout.decode()
        assert "" == actual

    def test_search_locally(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias", "--local", "local")
        actual = actual.stdout.decode()
        assert "localalias = status" in actual
        actual = temp_repo.invoke_extras_command("alias", "--local", "global")
        actual = actual.stdout.decode()
        assert "" == actual

    def test_get_alias_globally_and_defaultly(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias", "globalalias")
        actual = actual.stdout.decode()
        assert "globalalias = status" in actual

    def test_set_alias_globally_and_defaultly(self, temp_repo):
        temp_repo.invoke_extras_command("alias", "globalalias", "diff")
        actual = temp_repo.invoke_extras_command("alias")
        actual = actual.stdout.decode()
        assert "globalalias = diff" in actual

    def test_get_alias_locally(self, temp_repo):
        actual = temp_repo.invoke_extras_command("alias", "--local", "localalias")
        actual = actual.stdout.decode()
        assert "localalias = status" in actual

    def test_set_alias_locally(self, temp_repo):
        temp_repo.invoke_extras_command("alias", "--local", "localalias", "diff")
        actual = temp_repo.invoke_extras_command("alias")
        actual = actual.stdout.decode()
        assert "localalias = diff" in actual

    def test_teardown(self, temp_repo):
        git = temp_repo.get_repo_git()
        git.config("--global", "--unset", "alias.globalalias")
        git.config("--global", "--unset", "alias.x")
        git.config("--local", "--unset", "alias.localalias")
        git.config("--local", "--unset", "alias.y")
