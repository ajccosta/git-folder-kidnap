# git-folder-kidnap
Uses git-filter-repo to kidnap a repository's folder into a new repository. 

First, get git-filter-repo submodule
```
git submodule add https://github.com/newren/git-filter-repo gfr
git submodule init
git submodule update
```

Add git-filter-repo to PATH (even if only for this session):
```
PATH=$PATH:$PWD/gfr
```

Now call the `git-folder-kidnap.sh` script, it will guide you through the process.
```
git-folder-kidnap.sh
```
