import os
import subprocess
import shutil
import tempfile
import git

def invoke_git_extras_command(name, *params):
    current_dir = os.path.dirname(os.path.abspath(__file__))
    git_extras_bin = os.path.join(current_dir, "..", "bin")
    script = [os.path.join(git_extras_bin, name), *params]
    print(f"Run the script \"{script}\"")
    return subprocess.run(script, capture_output=True)

class TempRepository:
    def __init__(self, repo_work_dir = None):
        if repo_work_dir == None:
            repo_work_dir = tempfile.mkdtemp()
        self._cwd = repo_work_dir
        self._git_repo = git.Repo.init(repo_work_dir)
        self._files = []

    def switch_cwd_under_repo(self):
        os.chdir(self._cwd)
        print(f"The current work directory has switched to {self._cwd}")

    def get_cwd(self):
        return self._cwd

    def get_repo_git(self):
        return self._git_repo.git

    def get_file(self, index):
        return self._files[index]

    def get_files(self):
        return self._files

    def create_tmp_dir(self):
        tmp_dir = tempfile.mkdtemp()
        return tmp_dir

    def create_tmp_file(self, temp_dir = None):
        if temp_dir == None:
            temp_dir = self._cwd

        tmp_file = tempfile.mkstemp(dir=temp_dir)
        self._files.append(tmp_file[1])
        return tmp_file

    def remove_tmp_file(self, file_path):
        os.remove(file_path)
        print(f"File {file_path} has been removed")

    def writefile(self, temp_file, data):
        if data == None:
            return

        with open(temp_file, "w", encoding="utf-8") as f:
            f.write(data)

    def teardown(self):
        shutil.rmtree(self._cwd, ignore_errors=True)
        print(f"The temp directory {self._cwd} has been removed")

    def invoke_extras_command(self, name, *params):
        command = "git-" + name
        print(f"Invoke the git-extras command - {command}")
        return invoke_git_extras_command(command, *params)
