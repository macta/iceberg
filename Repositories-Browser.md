### Repositories Browser
The main entry point to Iceberg is the Repositories Browser. After installing Iceberg you will see a new entry on Pharo menu, below 'Tools' submenu, called Iceberg, which will open the browser.

![image](https://cloud.githubusercontent.com/assets/4633913/16365789/ac446d00-3c0a-11e6-83e0-976b00cbc0fb.png)

In the left pane you can see the list of all known repositories, you can add new repositories and you can *synchronize* a repository (see 'Synchronize Repository' section).

#### Adding new repositories
On top of the repositories panel you will see two actions that allow you to add new repositories to the Iceberg registry.
You can either create a new repository by cloning a remote repository (such as `git@github.com:username/projectname.git`) or you can add a local repository (which you have previously cloned).

##### Clone new repository
To clone a new repository you have to provide:
- The URL of a remote repository. Currently we support only SCP URLs (i.e. an URL with the form `[user@]host:filename`, frequently `git@github.com:username/projectname.git`), and therefore it is mandatory to have an SSH key to login to your repository.
- Optionally, select the location in your disk for the local repository. If you leave this emptoy, Iceberg will create a local repository in the default location (named `iceberg-cache`).
- Optionally you can select a subdirectory of your git repository in which your Pharo code is stored. By default it is the root of the repository, but frequently people prefere to put their code under `src` or `mc` (the latter is for historical reasons).

##### Add local Repository
To add an existing local repository you have to provide:
- Select the location in your disk where you have a previously cloned git repository.
- Optionally you can select a subdirectory of your git repository in which your Pharo code is stored. By default it is the root of the repository, but frequently people prefere to put their code under `src` or `mc` (the latter is for historical reasons).

#### Packages Panel
In the right pane you will see an overview of the current status of the selected repository: which packages are known to that repository and the status of each one. The status of a package can be one of:
- The package has changes in the image that could (should) be saved (commited) to the (local) repository.
- There are new versions (commits) of the package in a remote repository, that could (should) be incorporated into the image (i.e. *update* the package to a newer commit).
- There are commits in the local repository that can (should) be published into a remote repository, in order to make them disponible for other programmers.