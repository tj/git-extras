# Test for git-extras
The git-extras has its own testcases now, and the more is on the way! So let's introduce it.

We choose python to help us to reach to other shore cause **python is life saver**.

The test part depends on:

* python >= 3.11
* poetry >= 1.7.1
* pytest >= 7.4
* gitpython >= 3.1.40

So the versions are higher than above is recommended.

# How to test
1. Install `poetry`
2. Install the dependencies via `poetry install --no-root`
3. Run `poetry run pytest`

It is done or go without `poetry`,

1. Install python >= 3.11
2. Install pytest >= 7.4
3. Install gitpython >= 3.1.40
4. Run `pytest`

The second way maybe blocked the some missing dependencies at someday, so the first one is recommended.

# References
* [poetry](https://github.com/python-poetry/poetry)
* [pytest](https://github.com/pytest-dev/pytest/)
* [git python](https://github.com/gitpython-developers/GitPython)
