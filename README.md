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

### Kidnapping a folder
Now call the `git-folder-kidnap.sh` script, it will guide you through the process (you will want to be outside of this repository).
```
cd ..
./git-folder-kidnap/git-folder-kidnap.sh
```

You can also supply the arguments when you invoke the script, surpassing input requests:
```
cd ..
./git-folder-kidnap/git-folder-kidnap.sh <source repo url> <path/to/folder/to/kidnap> <dest repo url>
```

### Removing folders or files and their history from a repository
If you just wish to completely remove a folder or file from a repository (as if it never existed), you may also call the `git-folder-remove.sh` script like so:
```
cd ..
./git-folder-kidnap/git-folder-remove.sh
```

Again, you may supply the arguments immediately:
```
cd ..
./git-folder-kidnap/git-folder-remove.sh <repo url> <folder1,folder2,file3,...,fileN>
```
