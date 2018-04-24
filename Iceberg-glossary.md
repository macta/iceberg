Git is complicated. Git with images is even more complicated.
This page introduces the vocabulary used by Iceberg. Part of this vocabulary is Git vocabulary, part of it is Github's vocabulary, part of it is introduced by iceberg.

### Local Repository Missing (Iceberg)
The **Local Repository Missing** status is shown by iceberg when a project in the image does not found its repository in disk. This happens most probably because you've downloaded an image that somebody else created, or you deleted/moved a git repository in disk. Most of the times this status is not shown because iceberg automatically manages disk repositories.

To recover from this status, you need to update your repository by cloning a new git repository or by configuring an existing repository in disk.

### Fetch required. Unknown ... (Iceberg)
The **Fetch required** status is shown by iceberg when a project in the image was loaded from a commit that cannot be found in its repository in disk. This happens most probably because you've downloaded an image that somebody else created, and/or your repository in disk is not up to date.

To recover from this status, you need to fetch from remotes to try to find the missing commit. It may happen that the missing commit is not in one of your configured remotes (even that nobody ever pushed it). In that case, the easiest solution is to discard your image changes and checkout an existing branch/commit.

### Detached Working Copy (Iceberg)
The **Detached working Copy** status is shown by iceberg when a project in the image was loaded from a commit does not correspond with the current commit in disk. This happens most probably because you've modified your repository from the command line.

To recover from this status, you need to align your repository with your working copy. Either you can (1) discard your image changes and load the repository commit, (2) checkout a new branch pointing to your working copy commit or (3) merge what is in the image into the current branch.

### Detached HEAD (Git)
The **Detached HEAD** status means that the current repository in disk is not working on a branch but on a commit. From a git stand-point you can commit and continue working but your changes may get lost as the commit is not pointed by any branch. From an Iceberg stand-point, we forbid commit in this state to avoid strange situations.

To recover from this status, you need to checkout a (new or existing) branch.