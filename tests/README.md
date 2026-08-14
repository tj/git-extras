# Testing

Tests are written in Bats so coverage can be calculated for shell commands.

## Bats Testing

We require a somewhat recent version of Bats. Version v1.8.1 is tested in CI. Once it is installed, the tests can be executed like so:

```sh
bats ./tests
```

We highly recommend adding Bats tests for new features and fixes.

### Code Coverage

Coverage can be calculated with [bashcov](https://github.com/infertux/bashcov) like so:

```sh
bashcov -- bats ./tests
```

By default, the report will be generated in `./coverage/index.html`.
