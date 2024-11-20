#!/bin/sh -l

cd $GITHUB_WORKSPACE

exec 5>&1
COMMAND="goimports -l -w \`find $1 -name '*.go' | grep -v vendor"
echo "The following paths have been excluded"
for i in $(echo $INPUT_EXCLUDES | tr "," "\n")
do
  echo $i
  COMMAND="$COMMAND | grep -Ev ^$i"
done
END='` | tee /dev/fd/5'
COMMAND="$COMMAND$END"
GOIMPORTS_OUTPUT=`eval echo $COMMAND`
if [ -z "$GOIMPORTS_OUTPUT" ]; then
  echo "The following has imports not properly ordered"
  bar=$(echo $GOIMPORTS_OUTPUT | cut -c 17-)
  echo "$bar" | tr ' ' '\n'
  exit 1
fi

echo "goimports-output=Goimports step succeed" >> ${GITHUB_OUTPUT}
