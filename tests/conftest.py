# Sharing fixtures
# Ref: https://docs.pytest.org/en/6.2.x/fixture.html#scope-sharing-fixtures-across-classes-modules-packages-or-session

import pytest
from helper import TempRepository

def create_repo(dirname = None):
    repo = TempRepository(dirname)
    tmp_file_a = repo.create_tmp_file()
    tmp_file_b = repo.create_tmp_file()
    repo.switch_cwd_under_repo()
    return repo

def init_repo_git_status(repo):
    git = repo.get_repo_git()
    git.add(".")
    git.config("--local", "user.name", "test")
    git.config("--local", "user.email", "test@git-extras.com")
    git.commit("-m", "chore: initial commit")

@pytest.fixture(scope="module")
def temp_repo():
    repo = create_repo()
    init_repo_git_status(repo)
    return repo

@pytest.fixture(scope="module")
def named_temp_repo(request):
    dirname = request.param
    repo = create_repo(dirname)
    init_repo_git_status(repo)
    return repo
