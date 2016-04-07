#!/usr/bin/env bash
#Before launch, initialise ${GH_TOKEN} and ${GH_REF}
#Tokens are github passwords you generate. It is needed to update repositery, see : https://github.com/settings/tokens
#$ export GH_REF="github.com/$user/Geconomicus.git"
#$ export GH_TOKEN=[token]
#$ ./deploy_github_pages.sh
current_dir=$(pwd);
set -e && \
cd ./rst/build/html/ && \
touch .nojekyll && \
echo "geconomicus.glibre.org" > CNAME && \
remote_repo="https://${GH_TOKEN}@${GH_REF}" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "galuel" && \
git config user.email "galuel@glibre.org" && \
git add . && \
git commit -m'build' && \
git push --force --quiet $remote_repo master:$remote_branch > /dev/null 2>&1 && \
rm -fr .git && \
cd ${current_dir}
