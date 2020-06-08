## assimp-lambda-layer

This is a Docker image for building Assimp as a AWS Lambda Layer for building serverless applications

## Prerequisites
1. **Docker**

### Example usage:

```bash 
$ sh ./build.sh
```
This will build the docker container and copy over the zip required to upload to a layer.
You can upload this zip directly to the layer and ``` assimp ``` would now be available on the command line.