# Installing git-extras

## Installing with a package manager

### Debian

```bash
$ sudo $apt_pref update
$ sudo $apt_pref install git-extras
```

### Mac OS X with Homebrew

```bash
$ brew install git-extras
```

## Building from source

Obtain the git-extras source by cloning [its GitHub repo](https://github.com/tj/git-extras.git) or downloading a tarball of a [release](https://github.com/tj/git-extras/releases). Then install it by doing `make install` from the source tree.

```bash
$ git clone https://github.com/tj/git-extras.git
$ cd git-extras
# checkout the latest tag
$ git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
$ [sudo] make install
```

By default, git-extras is installed under `/usr/local`. To install it at an
alternate location, specify a `PREFIX` when calling `make`.

```bash
# Non-root users can install under their home directory
make install PREFIX=$HOME/software

# For third-party software kept under /opt
make install PREFIX=/opt
```

If you want to relocate the bulk of the installation but still have configuration
files installed to the system `/etc` dir or other alternate location, you can
specify `SYSCONFDIR` in addition to `PREFIX`.

```
$ sudo make install PREFIX=/usr/local SYSCONFDIR=/etc
```

See the Makefile for details on advanced configuration options.

## Installing from network

One-liner:

```bash
curl -sSL http://git.io/git-extras-setup | sudo bash /dev/stdin
```

## Updating

If you installed git-extras with a package manager, use that package manager's tools to update it.

If you installed git-extras from source, you can run `git-extras update` to update it to the latest release. Be aware that this may lose any configuration options you specified during the original installation.

## Windows (use it at your own risk)

First, please install `Git for Windows 2.x` from 'https://github.com/git-for-windows/git/releases'
and the basic [msys2][1].
Second, clone the `git-extras` repo into any folder you like.
```bash
git clone https://github.com/tj/git-extras.git
# checkout the latest tag (optional)
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
```

After that, execute the `install.cmd` in the command prompt, with the path your `Git for Windows 2.x` is installed.
For example, I install it in the folder called `C:\SCM\PortableGit` and
the `PREFIX` should be `C:\SCM\PortableGit\mingw64` (for 64-bit release)
or `C:\SCM\PortableGit\mingw32` (for 32-bit release). So I will execute the `install.cmd` like this:
```batch
install.cmd "C:\SCM\PortableGit\mingw64"
```

Last, please copy `colrm.exe` and `column.exe` from `folder-your-msys2-installed/usr/bin` to
`folder-your-git-installed/usr/bin`.

Enjoy `git-extras`!

[1]: http://sourceforge.net/projects/msys2/
