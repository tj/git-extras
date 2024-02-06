# Test for git-extras
The git-extras has its own testcases now, and the more is on the way! So let's introduce it.

We choose python to help us to reach to other shore cause **python is life saver**.

The test part depends on:

* python >= 3.11
* poetry >= 1.7.1
* pytest >= 7.4
* gitpython >= 3.1.40

So the versions are higher than above is recommended.

# How to run the tests
1. Install `poetry`
2. Install the dependencies via `poetry install --no-root`
3. Run `poetry run pytest`

It is done or go without `poetry`,

1. Install python >= 3.11
2. Install pytest >= 7.4
3. Install gitpython >= 3.1.40
4. Run `pytest`

The second way maybe blocked the some missing dependencies at someday, so the first one is recommended.

# What and how to create a unit test
One command has a unit test, because one `git-*` command is just do one thing, so we can eat a piece of `git-*` command in one time.

For example,

1. The `git-alias` should has a test suite, so create `test_git_alias.py` in the directory `test`
2. Create a test class `TestGitAlias` in the `test_git_alias.py`
3. Create a test case `test_init`, and some test fixtures can be used, `temp_repo`, `named_temp_repo` etc.
    * `temp_repo` is module scoped fixture which create a temporary directory and available in the test suite `test_git_alias.py`.
    * `named_temp_repo` is just same as `temp_repo` except the custom directory renaming.
4. Loop the third step until the 100% coverage of the function of the `git-alias`

# References
* [poetry](https://github.com/python-poetry/poetry)
* [pytest](https://github.com/pytest-dev/pytest/)
* [git python](https://github.com/gitpython-developers/GitPython)
