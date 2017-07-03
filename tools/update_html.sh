files=`git diff --name-only | grep ".adoc"`

for f in $files
do 
echo "asciidoctor -n $f"
asciidoctor -n $f
done
