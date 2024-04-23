# git-folder-kidnap
Uses git-filter-repo to kidnap a repository's folder into a new repository. 

Make sure to include the git-filer-repo submodule in your clone command:
```
git clone https://github.com/ajccosta/git-folder-kidnap.git --recurse-submodules
```

Add git-filter-repo to PATH (even if only for this session):
```
PATH=$PATH:$PWD/gfr
```

Now call the `git-folder-kidnap.sh` script, it will guide you through the process (you will want to be outside of this repository).
```
cd ..
./git-folder-kidnap/git-folder-kidnap.sh
```
