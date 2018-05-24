There are several points in which Iceberg could be improved. Some of them are outside our scope because of missing knowledge, some others because missing time. Besides issue fixing and reviews, this page explains several standalon sub-projects in which people could help to improve Iceberg's general quality, while still being a standalone project in itself.

# Support for tags

Probably the easiest in the list. This could be split into several different milestones:
1. Libgit should be extended with primitives to access tags and their pointed commitish.
2. Iceberg backend support to get and creates tags per commit.
3. UI support
4. Metacello support. Identify that a commitish and a tag are aliases to the same commit to avoid false positives in conflict detection.

# OAuth token authentication support

https://stackoverflow.com/questions/25409700/using-gitlab-token-to-clone-without-authentication
https://stackoverflow.com/questions/42148841/github-clone-with-oauth-access-token

Some hostings allow users to generate an authentication token which can then be used to authenticate instead of inserting a user/password. There is a missing UI support for this, and further testing.

# SSH passphrase support

Iceberg handles nowadays only ssh keys without passphrases. We should investigate what changes should be done to libgit to intercept a password request, and to have decent UI support for it also.

# Two-factor authentication

If you have two-factor authentication enabled in your server (e.g., in github), you should be prompted for a code in order to give access to the repository. Iceberg misses support for this.

https://blog.github.com/2013-09-03-two-factor-authentication/

# Keychain/Similar support

Nobody wants to store their passwords in clear case. Not in memory, not in a file in disk. Several systems such as Keychain exist to store passwords securily in one's machine. We could add support for it to remember all different passwords required by iceberg for pulling, pushing, or access the github API.