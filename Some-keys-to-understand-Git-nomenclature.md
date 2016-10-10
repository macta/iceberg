### Local and remote repositories


### Commit-ish
A commit-ish is a string that allows to specify a commit. Git command line tools usually when they need to operate on a commit they require to operate on a commit they accept several ways of specifying it, such as a or tag name, a SHA1 commit id, and several fatality-like combinations of symbols such as HEAD^, @{u} or master~2.

The following table contains examples for each commit-ish expression. A complete description of the ways to specify a commit (and other git objects) can be found [here](https://www.kernel.org/pub/software/scm/git/docs/gitrevisions.html#_specifying_revisions). 
```
----------------------------------------------------------------------
|    Format                 |                Examples
----------------------------------------------------------------------
|  1. <sha1>                | dae86e1950b1277e545cee180551750029cfe735
|  2. <describeOutput>      | v1.7.4.2-679-g3bee7fb
|  3. <refname>             | master, heads/master, refs/heads/master
|  4. <refname>@{<date>}    | master@{yesterday}, HEAD@{5 minutes ago}
|  5. <refname>@{<n>}       | master@{1}
|  6. @{<n>}                | @{1}
|  7. @{-<n>}               | @{-1}
|  8. <refname>@{upstream}  | master@{upstream}, @{u}
|  9. <rev>^                | HEAD^, v1.5.1^0
| 10. <rev>~<n>             | master~3
| 11. <rev>^{<type>}        | v0.99.8^{commit}
| 12. <rev>^{}              | v0.99.8^{}
| 13. <rev>^{/<text>}       | HEAD^{/fix nasty bug}
| 14. :/<text>              | :/fix nasty bug
----------------------------------------------------------------------
```