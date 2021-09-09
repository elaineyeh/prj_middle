echo $CIRCLE_PROJECT_REPONAME
cd nginx/$CIRCLE_PROJECT_REPONAME
export CIRCLE_PROJECT_REPONAME=$CIRCLE_PROJECT_REPONAME
pwd
git pull

mkdir -p ../docker-compose
cp docker-compose.yml ../docker-compose
ls

cd ../docker-compose
FILE="docker-compose"
FILENAME=`ls ./*.yml`
echo $FILENAME
for EACHFILE in FILENAME
do
    FILE+=" -f $EACHFILE"
done
FILE+=" up -d"

echo $FILE
echo $FILE > run.sh
sh run.sh
