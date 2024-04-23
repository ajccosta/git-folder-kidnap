#!/bin/bash

#Removes folder from git repository history
repo_url=$1
folders=$2 #',' separated folders

if [ "$repo_url" == "" ]; then
    read -p "What is URL of the repository you want to remove a folder or file from? " repo_url
fi

repo_name=$(echo $repo_url | rev | cut -d'/' -f1 | rev | sed 's/.git//g')
git clone $repo_url
echo -e "Entering ./$repo_name"
cd $repo_name


if [ "$folders" == "" ]; then
    read -p "[$repo_name] What is the folder or file you want to remove? " folders
fi

i=1
exiting="false"
if [[ ! $folders == *","* ]]; then
    #if folders does not have a ',' cut -d -fx always equals folders = infinite loop
    folders="$folders," 
fi

while [[ "$exiting" == "false" ]] ; do
    dir=$(echo "$folders" | cut -d, -f$i);

    if [[ "$dir" == "" ]]; then
        read -p "[$repo_name] Do you want to remove more folders or files? If yes, which one, else say 'n'. " dir
        case $dir in
            [Nn]* ) echo "[$repo_name] Continuing."; exiting="true"=;;
            * ) : ;;
        esac
    fi

    echo "[$repo_name] Removing $dir."
    git-filter-repo --path $dir --invert-paths
    i=$((i+1));
done

git remote add origin $repo_url
git push --set-upstream origin main
main_branch=$(git remote show $(git remote show | head -n1) | sed -n '/HEAD branch/s/.*: //p')
git pull
git push -u origin $main_branch --force-with-lease
