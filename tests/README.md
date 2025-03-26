# Testing

Originally, the tests were written in pytest. However, tests are in the process of being converted to Bats so coverage can be calculated.

## Bats Testing

We require a somewhat recent version of Bats. Version v1.8.1 is tested in CI. Once it is installed, the tests can be executed like so:

```sh
bats ./tests
```

We highly recommend adding tests for new features and fixes.

### Code Coverage

Coverage can be calculated with [bashcov](https://github.com/infertux/bashcov) like so:

```sh
bashcov -- bats ./tests
```

By default, the report will be generated in `./coverage/index.html`.

## Python Testing

The test part depends on:

* python >= 3.11
* poetry >= 1.8.0
* pytest >= 8.1.2
* gitpython >= 3.1.43

So the versions are higher than above is recommended.

### How to run the tests

1. Install `poetry`
2. Install the dependencies via `poetry install`
3. Run `poetry run pytest`

It is done or go without `poetry`,

1. Install python >= 3.11
2. Install pytest >= 8.1.2
3. Install gitpython >= 3.1.43
4. Install testpath >= 0.6.0
5. Run `pytest`

The second way maybe blocked the some missing dependencies at someday, so the first one is recommended.

### What and how to create a unit test

One command has a unit test, because one `git-*` command is just do one thing, so we can eat a piece of `git-*` command in one time.

For example,

1. The `git-alias` should have a test suite, so create `test_git_alias.py` in the directory `test`
2. Create a test class `TestGitAlias` in the `test_git_alias.py`
3. Create a test case `test_init`, and some test fixtures can be used, `temp_repo`, `named_temp_repo` etc.
    * `temp_repo` is module scoped fixture which create a temporary directory and available in the test suite `test_git_alias.py`.
    * `named_temp_repo` is just same as `temp_repo` except the custom directory renaming.
4. Loop the third step until the 100% coverage of the function of the `git-alias`

### References

* [poetry](https://github.com/python-poetry/poetry)
* [pytest](https://github.com/pytest-dev/pytest/)
* [git python](https://github.com/gitpython-developers/GitPython)
