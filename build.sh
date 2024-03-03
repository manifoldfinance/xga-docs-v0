#!/usr/bin/env bash

echo " ✔︎ Staring Build process.."
echo ""
check_mark="\033[1;32m✔\033[0m"

header() { echo -e "\n\033[1m$1\033[0m"; }


header "Loading Build Enviornment...\n"

pip install -r requirements.txt
pip install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git

mkdir -p public/.well-known
mkdocs build --clean --strict --site-dir public/
touch public/.nojekyll

header "Next Steps\n"
echo "Build Artifact is available at: public/build_id.txt"


date "+%Y-%m-%dT%H:%M:%S%z" > public/build_id.txt
#printf  "\033[1A ${check_mark} "
printf "..%s.." "\033[1A ${check_mark} "


TZ=UTC git show --quiet --date="format-local:%Y.%-m.%-d" --format="nightly-%cd" >public/.well-known/nightly-release.txt
sleep 1
exit 0

