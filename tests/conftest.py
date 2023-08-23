import os
import subprocess
import tempfile
import pytest

@pytest.fixture(scope="module")
def git_repo():
    tmp_dir = tempfile.TemporaryDirectory()
    tmp_file_a = tempfile.TemporaryFile(mode="w+b", dir=tmp_dir.name)
    tmp_file_b = tempfile.TemporaryFile(mode="w+b", dir=tmp_dir.name)
    os.chdir(tmp_dir.name)
    result = subprocess.run(["git", "init"], capture_output=True)
    print(result)
    result = subprocess.run(["git", "add", "."], capture_output=True)
    print(result)
    result = subprocess.run(["git", "commit", "-m", "initial commit"], capture_output=True)
    print(result)
    yield [tmp_dir, tmp_file_a, tmp_file_b]
    tmp_dir.cleanup()
