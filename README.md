# CIS560Project1

How to open a pull request:

1. make sure all changes are committed
2. run `git push origin [branch name]` (replace [branch name] with actual branch name)
3. go to https://github.com/bsteg17/CIS560Project1 (this is our base branch)
4. if you see a button that says 'Open Pull Request' along with your branch name then click on it and skip to step 10
5. otherwise, click 'New Pull Request'
6. click 'compare across forks'
7. click the 'head fork' dropdown and select your fork
8. click the 'compare' dropdown directly to the right and click on your branch name
9. click create pull request
10. fill out some info about your pull request and submit

How to git pull changes from the base branch:

1. run `git remote` if your console prints 'upstream' then skip to step 3
2. run `git remote add upstream https://github.com/bsteg17/CIS560Project1`
3. run `git pull upstream master` to pull from upstream master branch
