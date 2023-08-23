# Sharing fixtures
# Ref: https://docs.pytest.org/en/6.2.x/fixture.html#scope-sharing-fixtures-across-classes-modules-packages-or-session

import pytest
from helper import TempRepository

@pytest.fixture(scope="module")
def temp_repo():
    repo = TempRepository()
    git = repo.get_repo_git()
    tmp_file_a = repo.create_tmp_file()
    tmp_file_b = repo.create_tmp_file()
    repo.switch_cwd_under_repo()
    git.add(".")
    git.config("--local", "user.name", "test")
    git.config("--local", "user.email", "test@git-extras.com")
    git.commit("-m", "chore: initial commit")
    return repo
