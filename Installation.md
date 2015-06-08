## Debian

```bash
$ sudo $apt_pref update
$ sudo $apt_pref install git-extras
```

## Mac

```bash
$ brew install git-extras
```

## Clone / Tarball:

```bash
$ git clone https://github.com/tj/git-extras.git
$ cd git-extras
# checkout the latest tag
$ git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
$ [sudo] make install
```

One-liner:

```bash
curl -s https://raw.githubusercontent.com/tj/git-extras/master/install.sh | [sudo] bash /dev/stdin
```
