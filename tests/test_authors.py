import os, subprocess

expected_authors_list = "test <test@git-extras.com>\ntestagain <testagain@git-extras.com>\n"
expected_authors_list_without_email = "test\ntestagain\n"
authors_file = "AUTHORS"

class TestGitAuthors:
    def test_init(self, temp_repo):
        git = temp_repo.get_repo_git()
        tmp_file = temp_repo.get_file(0)
        temp_repo.writefile(tmp_file, "A")
        git.add(".")
        git.commit("-m", "test: add data A")
        git.config("--local", "user.name", "testagain")
        git.config("--local", "user.email", "testagain@git-extras.com")
        temp_repo.writefile(tmp_file, "B")
        git.add(".")
        git.commit("-m", "test: add data B")

    def test_output_authors_has_email_without_any_parameter(self, temp_repo):
        git = temp_repo.get_repo_git()
        rs = temp_repo.invoke_extras_command("authors")
        with open(authors_file) as f:
            content = f.read()
            print(content)
            print(expected_authors_list)
            assert content == expected_authors_list

    def test_list_authors_has_email_defaultly(self, temp_repo):
        git = temp_repo.get_repo_git()
        actual = temp_repo.invoke_extras_command("authors", "--list")
        actual = actual.stdout.decode()
        assert actual == expected_authors_list
        actual = temp_repo.invoke_extras_command("authors", "-l")
        actual = actual.stdout.decode()
        assert actual == expected_authors_list

    def test_list_authors_has_not_email(self, temp_repo):
        git = temp_repo.get_repo_git()
        actual = temp_repo.invoke_extras_command("authors", "--list", "--no-email")
        actual = actual.stdout.decode()
        assert actual == expected_authors_list_without_email
        actual = temp_repo.invoke_extras_command("authors", "-l", "--no-email")
        actual = actual.stdout.decode()
        assert actual == expected_authors_list_without_email

    def test_output_authors_has_email_into_AUTHORS(self, temp_repo):
        git = temp_repo.get_repo_git()
        temp_repo.invoke_extras_command("authors", "--output")
        with open(authors_file) as f:
            content = f.read()
            assert content == expected_authors_list

    def test_output_authors_has_email_into_target_file(self, temp_repo):
        git = temp_repo.get_repo_git()
        temp_repo.invoke_extras_command("authors", "--output", "AUTHORS_TARGET_FILE_A")
        with open("AUTHORS_TARGET_FILE_A") as f:
            content = f.read()
            assert content == expected_authors_list

    def test_output_authors_has_not_email_into_target_file(self, temp_repo):
        git = temp_repo.get_repo_git()
        rs = temp_repo.invoke_extras_command("authors", "--output", "AUTHORS_TARGET_FILE_B", "--no-email")
        with open("AUTHORS_TARGET_FILE_B") as f:
            content = f.read()
            assert content == expected_authors_list_without_email

    def test_fail_to_output_authors_when_an_option_like_follow_output_parameter(self, temp_repo):
        git = temp_repo.get_repo_git()
        actual = temp_repo.invoke_extras_command("authors", "--output", "--no-email")
        actual = actual.stderr.decode()
        assert actual == "option --output requires a path-like value\n"

    def test_fail_to_output_authors_when_only_no_email_option(self, temp_repo):
        git = temp_repo.get_repo_git()
        actual = temp_repo.invoke_extras_command("authors", "--no-email")
        actual = actual.stderr.decode()
        assert actual == "--no-email option only can be used with --list | -l | --output\n"
