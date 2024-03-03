#!/usr/bin/env bash

generate() {
	cat >platform-docs.xml <<EOF
<entry>
  <version>$(date +%Y-%m-%d)-$(git rev-parse HEAD)</version>
  <url>https://mevauction.com/.well-known/platform-docs.tgz</url>
</entry>
EOF
}

generate

git show -s --format=%ct HEAD >commit-ts.txt
git hash-object --no-filters >githash.txt

exit 0
#git show -s --format=%ct HEAD
