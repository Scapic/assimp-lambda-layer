TAG="assimp"

echo "USING TAG $TAG to build image"

docker build -t "$TAG" .

echo "BUILT $TAG image"

DOCKER_BUILD_HASH=$(docker run -d "$TAG")

echo "Using image $DOCKER_BUILD_HASH"

echo "Copying files"

docker cp "$DOCKER_BUILD_HASH":bin.zip ./bin.zip

echo "Copied files, exiting !"