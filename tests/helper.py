import os, subprocess, stat, shutil, tempfile, git

CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))
GIT_EXTRAS_BIN = os.path.join(CURRENT_DIR, "..", "bin")
GIT_EXTRAS_HELPER = os.path.join(CURRENT_DIR, "..", "helper")

def invoke_git_extras_command(name, *params):
    script = [os.path.join(GIT_EXTRAS_BIN, name), *params]
    print(f"Run the script \"{script}\"")
    return subprocess.run(script, capture_output=True)

class TempRepository:
    def __init__(self, repo_work_dir = None):
        self._system_tmpdir = tempfile.gettempdir()
        if repo_work_dir == None:
            repo_work_dir = tempfile.mkdtemp()
        else:
            repo_work_dir = os.path.join(self._system_tmpdir, repo_work_dir)
        self._cwd = repo_work_dir
        self._tempdirname = self._cwd[len(self._system_tmpdir) + 1:]
        self._git_repo = git.Repo.init(repo_work_dir)
        self._files = []

    def switch_cwd_under_repo(self):
        os.chdir(self._cwd)
        print(f"The current work directory has switched to {self._cwd}")

    def get_cwd(self):
        return self._cwd

    def get_repo_dirname(self):
        return self._tempdirname

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
        command_name = "git-" + name
        print(f"Invoke the git-extras command - {command_name}")
        return invoke_git_extras_command(command_name, *params)

    def invoke_installed_extras_command(self, name, *params):
        command_name = "git-" + name
        print(f"Invoke the git-extras command - {command_name}")
        origin_extras_command = os.path.join(GIT_EXTRAS_BIN, command_name)
        temp_extras_command = os.path.join(self._cwd, command_name)
        helpers = [
                os.path.join(GIT_EXTRAS_HELPER, "git-extra-utility"),
                os.path.join(GIT_EXTRAS_HELPER, "is-git-repo")]

        if not os.path.exists(temp_extras_command):
            whole = []
            with open(temp_extras_command, "w") as t:
                for helper in helpers:
                    with open(helper) as h:
                        content = h.read()
                        whole.extend(content.splitlines())
                with open(origin_extras_command) as o:
                    content = o.read()
                    first, *rest = content.splitlines()
                    whole.extend(rest)
                    whole.insert(0, first)
                t.write("\n".join(whole))
                print("Update file {temp_extras_command}:\n{t.read()}")
            os.chmod(temp_extras_command, 0o775)

        return subprocess.run([temp_extras_command, *params], capture_output=True)
