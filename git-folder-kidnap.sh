repo_url=$1
repo_folder_path=$2
repo_url_dest=$3

if [ "$repo_url" == "" ]; then
    read -p "What is URL of the repository you want to kidnap a folder from? " repo_url
fi
repo_name=$(echo $repo_url | rev | cut -d'/' -f1 | rev | sed 's/.git//g')
git clone $repo_url

echo -e "Entering ./$repo_name"
cd $repo_name

if [ "$repo_folder_path" == "" ]; then
    read -p "[$repo_name] What is the path to the folder to be kidnaped? " repo_folder_path
fi
while [ "$(cd $repo_folder_name |& grep "No")" != "" ]; do
    echo "[$repo_name] That folder path does not exist!"
    read -p "[$repo_name] What is the path to the folder to be kidnaped? " repo_folder_path
done

git filter-repo --path $repo_folder_path
git filter-repo --subdirectory-filter  $repo_folder_path

if [ "$repo_url_dest" == "" ]; then
    read -p "[$repo_name/$repo_folder_path] What is URL of the repository you want to kidnap a folder to? " repo_url_dest
fi
git remote add origin $repo_url_dest
git remote -v
read -p "[$repo_name/$repo_folder_path] Was the remote URL added [y/n]? " yn
case $yn in
    [Nn]* ) exit;;
    * ) echo "";;
esac

main_branch=$(git remote show $(git remote show | head -n1) | sed -n '/HEAD branch/s/.*: //p')
git pull
git push -u origin $main_branch --force-with-lease
echo "Finished! You should remove the ./$repo_name folder."
