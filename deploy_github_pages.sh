#!/usr/bin/env bash
current_dir=$(pwd);
set -e && \
cd ./rst/build/html/ && \
touch .nojekyll && \
echo "geconomicus.glibre.org" > CNAME && \
remote_repo="https://${GH_TOKEN}@${GH_REF}" && \
remote_branch="gh-pages" && \
git init && \
git config user.name "Travis CI" && \
git config user.email "nobody@nobody.org" && \
git add . && \
git commit -m'build' && \
git push --force --quiet $remote_repo master:$remote_branch > /dev/null 2>&1 && \
rm -fr .git && \
cd ${current_dir}
