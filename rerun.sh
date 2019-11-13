echo "rerun.sh"

echo "param module \$1: $1"
echo "param environment \$2: $2"

echo "retrieve pid of running serice"
PROC=`ps aux | grep "[t]arget/$PROJECT" | grep -F -i "Dspring.profiles.active=$ENVIRONMENT"`
ARRAY=(\$PROC)
PROC ${ARRAY[1]}
echo "killing pid $PROC"
kill $PROC
echo "starting new deployment"
DEST="/var/project-checker/app/$2"
DEST_LOGS="/var/project-checker/app/$2/logs/$2-$1.log"
echo "copy .jar"
cp -rf "$1/target/$1*.jar" "$DEST/"
#prevent jenkins from stopping the java process
BUILD_ID=dontkillme java -jar -Dspring.profiles.active="$1" -Dmaven.test.skip=true "$DEST/$1*.jar" >> "$DEST_LOGS" &
