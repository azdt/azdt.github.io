files=`git diff --name-only`

for f in $files
do 
echo "git add $f"
git add $f
done
