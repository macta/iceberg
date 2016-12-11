While Iceberg has a project-oriented nature, packages still do exist and also Iceberg uses some underlying tools that do think in packages. Moving a class to another package is supported gracefully by Iceberg, but if someone else makes changes to the class at the same moment, then merging both branches together will not be so easy. 

I found my self trying to solve such a solution and, while Iceberg does not have a UI to do such a complex merge yet, it is doable using Iceberg API + a few git commands. So I decided to document how to do this, maybe can help me figure out how to build a nicer UI to cope whith this kind of refactorings.

Next section introduces some vocabulary, I recommend its reading. The following one tries to describe why this problem arises, you can skip it if you want to go directly to the solution which is in the rest of this article.

# Merge vocabulary
Merge involves incorporating commits to the current branch. It is a far more common operation as you might expect, because it is done each time you do a _pull_ to merge your [upstream](Some-keys-to-understand-Git-nomenclature#upstream) branch into your current one.

To specify a merge you have to specify a commit, which usually is given by a branch name, but you could use a commit SHA directly or any [commitish](Some-keys-to-understand-Git-nomenclature#commit-ish). In the following, the object specifying the commit is called _target_ and the corresponding commit is called _target commit_.

Then, the _merge base_ is the latest commit that is ancestor to both commits being merged (i.e. your HEAD commit and the target commit.

Merges can be done using several strategies, I will focus in three categories of merges:
* **_Fast-forward_ merge** this is the easiest case, you are trying to merge with a commit which is a descendent of your HEAD. So there is nothing to _really_ merge, we just have to decide that the target commit is the new [tip](Some-keys-to-understand-Git-nomenclature#tip) of the HEAD branch.
* **_Real_ merge** in this case, none of the commits being merged is ancestor of the other, so we have to create a new one with both commits as parents. For the contents of the new commit, we have to analyze the changes that each one introduced, and for that matter we have to find a common ancestor: the merge base. We will compute the changes from each commit to the merge base and try to merge them in a new version of the code. This leads to two possible situations:
  * **No conflicts** either the two commits do not modify the same files or there is some strategy that allows to merge the changes automatically. In this case, git creates automatically the merged version.
  * **Conflicts** there is no automatic mechanism to merge the changes from each commit. The default behavior for git in this case is to leave a dirty working copy, which contains _unmerged files_, i.e. it writes in the same file the two conflicting version, using `>>>>`, `====` and `<<<<` as separator.

Personally, I do not like the last behavior at all, as your code will not be able to be load into Pharo after that. So, what Iceberg does is:
* For fast-forward or non-conflicting commits, we leave git do its job, and just reload the new version of the code.
* In case of conflicts, we will merge using the traditional Pharo tools, and then tell git which the merged version should be.

# So, why could this fail?
Traditional Pharo tools are package based, so you end up having a _Merge browser_ for each package. For simple merges this can work, yet not being ideal. But if you move a class from a package to another, the package-based merge is helpless.

Another possibility is to try have git doing the merge, sadly this does not work either. Even in the case in which git arrives to "solve" the conflicts he can only detect method (i.e. file) moves, so if I moved a method (or a class and hence its methods) and you modified the same method, git will detect it and it will be able to do the merge correctly. But git does not keep history of directories, only files. So if I move a directory (i.e. a class) and you add a method to that class, the method will be added in the original directory and git will not see this as a conflict. So you end with two directories for the same class, each with a subset of the methods, and the class properties files is only in one place, so the other directory does not even respect the filetree/cypress format, nor is interpreted as "extension methods". The filetree reader just does not arrive to read it.

# A possible solution
To solve this, we have to use Iceberg and Pharo in a package-less view. Current UI is yet not capable of doing this, but you can merge using the Iceberg API and a few git commands.

## Download the code to be merged
To operate this, you need to have the code in your local repository. In my case I received a pull request so I have to download it manually. As the writing of this Iceberg is not cabable of doing this, but we are working on it.

Add the repository holding the to-be-merged version as a remote:
```
git remote add pull-request git@github.com:demarey/iceberg.git
git fetch pull-request
```

And checkout the code in a new local branch:
```
 git co -b to-be-merged pull-request/dev-0.4
```
