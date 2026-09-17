DEST="/var/home/max-inspiron/GitHub/Wildapfel/portfolio/projects/pangenome/homo-sapiens-chr21/"
SRC=".."

rsync -av \
    $DEST \
    $SRC

for f in data/*/*.fna ; do
    head $f > $f.snippet;
    rm $f
done    
