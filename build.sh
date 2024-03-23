#!/usr/bin/env bash

echo " ✔︎ Staring Build process.."
echo ""
#check_mark="\033[1;32m✔\033[0m"

header() { echo -e "\n\033[1m$1\033[0m"; }


header "Loading Build Enviornment...\n"

python3 -m venv docs-venv
# shellcheck source=docs-venv/bin/activate
# shellcheck disable=SC1091
source docs-venv/bin/activate
pip3 install -r requirements.txt
pip3 install git+https://${GH_TOKEN}@github.com/squidfunk/mkdocs-material-insiders.git

mkdir -p public/.well-known
mkdocs build --clean --strict --site-dir public/
touch public/.nojekyll
cp platform-docs.xml public/.well-known/platform-docs.xml
cp commit-ts.txt public/.well-known/commit-ts.txt

header "Next Steps\n"
echo "Build Artifact is available at: site/build_id.txt"


date "+%Y-%m-%dT%H:%M:%S%z" > public/build_id.txt

TZ=UTC git show --quiet --date="format-local:%Y.%-m.%-d" --format="nightly-%cd" > public/.well-known/nightly-release.txt
sleep 1
exit 0

