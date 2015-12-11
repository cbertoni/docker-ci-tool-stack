echo "Stopping containers..."
docker stop `docker ps | awk '{print $1}'`
echo "Removing containers..."
docker rm `docker ps -a | awk '{print $1}'`