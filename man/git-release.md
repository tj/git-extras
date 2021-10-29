git-release(1) -- Commit, tag and push changes to the repository
================================================================

## SYNOPSIS

`git-release` [&lt;tagname&gt; | --semver &lt;name&gt;] [-r &lt;remote&gt;] [-m &lt;commit info&gt;] [--no-empty-commit] [-c] [-s] [-u &lt;key-id&gt;] [--prefix &lt;tag prefix&gt;] [[--] &lt;hook arguments...&gt;]

## DESCRIPTION

  Commits changes with message "Release &lt;tagname&gt;" or custom commit information, tags with the given &lt;tagname&gt; and pushes the branch / tags.

  This command always creates a release commit, which could be empty if nothing changed. It works like `git merge --no-ff`. If you don't like the behavior, you could add `--no-empty-commit` to skip it.

  Optionally it generates a changelog (see git-changelog) and a remote can be defined. The order of first -c or -r does not matter.

  If `.git/hook/pre-release` or `.git/hook/post-release` exist, they will be triggered with `tagname` and extra hook arguments before/after the release.

## OPTIONS

  --semver &lt;name&gt;

  If the latest tag in your repo matches the semver format requirement, you could increase part of it as the new release tag
  with this option. The name must be one of the `major`, `minor`, `patch`. For example, assumed the latest tag is `4.4.0`, with
  `git release --semver minor` you will make a new release with tag `4.5.0`. Use `--prefix` if tag has a character before semver.

  &lt;tagname&gt;

  The name of the newly created tag. Also used in tag comment.

  --prefix &lt;tag prefix&gt;

  Use a prefix with a semver tag. `git release --semver minor --prefix r` would increment the latest tag r4.4.0 to r4.5.0. This prefix
  can be any length, without spaces.

  -r &lt;remote&gt;

  The "remote" repository that is destination of a push operation: it is passed to git push.

  -m &lt;commit info&gt;

  use the custom commit information instead of the default message "Release &lt;tagname&gt;" .

  --no-empty-commit

  Avoid creating empty commit if nothing could be committed.

  -c

  Generates or populates the changelog with all commit message since the last tag. For more info see git-changelog..

  -s

  Create a signed and annotated tag.

  -u &lt;key-id&gt;

  Create a tag, annotated and signed with the given key.

  [--] hook arguments...

  The arguments listed after "--" separator will be passed to pre/post-release hook following the `tagname`.

## EXAMPLES

  * Release commit with the given &lt;tagname&gt;.

    $ git release 0.1.0

  * Release commit with the given &lt;tagname&gt; and custom commit message.

    $ git release 0.1.0 -m "+ powerful feature added."

  * Release commit with the given &lt;tagname&gt; and push to specific remote.

    $ git release 0.1.0 -r github

  * Release commit with the given &lt;tagname&gt; and populate changelog.

    $ git release 0.1.0 -c

  * Release commit with the given &lt;tagname&gt;, populate changelog, and push to specific remote.

    $ git release 0.1.0 -r github -c

  * Release commit with the given &lt;tagname&gt;, pass &lt;tagname&gt; and extra argument to release hook,
    populate changelog, and push to specific remote.

    $ git release 0.1.0 -r github -c -- --signature-required


## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;
Extended by David Hartmann &lt;<dh@tsl.io>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
