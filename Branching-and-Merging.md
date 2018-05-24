Merge is completely implemented on the Pharo side. It can moreover:
 - detect fast forward merge avoiding the creation of extra merge commits
 - proposing a single UI to resolve all conflicts of a project at once and not one per package

Iceberg's merge happen in memory. The reason behind this is that using Git's default merge mechanism would insert the >>>> <<<< markers in the conflicting files. This would break our parsers and all our tools.
Instead, we ask git for the list of conflicting files, and we build a diff tree in memory, that we later augment with information such as conflicts.

There are some issues we have seen when merging external files, but as soon as the two merged commits are not merging external files, but we hope we will fix them soon.

Missing feature: right now we can only choose between incoming or loaded version during a merge. It would be nice to be able to edit a method's code, picking part of the incoming code and part of the current code.

Missing feature 2: right now we resolve all conflicts in memory and commit them at once. We know some people would like to, instead, not do the merge automatically, so they can test it before committing. This should not be tooo difficult to do but it was down in the priority list :).

## Basic Demo
https://www.youtube.com/watch?v=DBzkjwABPEI

This video shows in a simple example how to branch, merge and checkout different commits.
In this video we first create a new class with a method, then we create another branch and force a conflict. We resolve the conflict during merge.

In the middle, bonus feature, we checked out a commit and stayed in Detached HEAD for a while ;)