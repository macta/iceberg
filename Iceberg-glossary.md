## Synchronize a repository
To synchronize two repositories means to ensure that they have both the same version(s) of the code. When we talk about synchronizing *one repository* means to synchronize it with [(one of) its remote repository(ies)](../Some-keys-to-understand-Git-nomenclature#local-and-remote-repositories).

Synchronizing can implicate several actions:
* (First) commit local changes (i.e. save code from your image into your local repository, in the form of a new commit).
* Load code from your local repository into your image (in case you changed your local repository from outside Iceberg).
* Download new commits (and maybe branches) from the remote repository into your local repository, update your local branches with those commits, load that code into your image (several actions usually encompassed as *pull*).
* Merge the remote changes with your local changes (frequently generating a new commit, i.e. a *merge commit*).
* Upload your new commits to the remote repository.