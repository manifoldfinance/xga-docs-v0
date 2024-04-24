#!/usr/bin/env bash


mkdir -p site/.well-known
mkdocs build --clean  --site-dir site/
touch site/.nojekyll


cp platform-docs.xml site/.well-known/platform-docs.xml
cp commit-ts.txt site/.well-known/commit-ts.txt
cp sitemap.xml site/sitemap.xml
cp nightly-release.txt site/.well-known/nightly-release.txt

header "Next Steps\n"
echo "Build Artifact is available at: site/build_id.txt"


date "+%Y-%m-%dT%H:%M:%S%z" > site/build_id.txt
