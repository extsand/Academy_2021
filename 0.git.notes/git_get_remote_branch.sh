#Git helper file
# How to get remote branch from git

git clone git://example.com/myproject
cd myproject

git branch
* main

git branch -a
* main
  remotes/origin/HEAD
  remotes/origin/main
  remotes/origin/app_branch_1
  remotes/origin/app_branch_2

git checkout remotes/original/app_branch_2
git checkout app_branch_2
  

git branch

#list of commits
gitk --all & 


#chaining command to push
git add .; git commit -m 'add file'; git push