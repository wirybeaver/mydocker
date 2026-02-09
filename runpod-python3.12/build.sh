#!/bin/bash

# Build and push script for Runpod Docker image
# Usage: ./build.sh [your-dockerhub-username]

if [ -z "$1" ]; then
    echo "Usage: $0 <dockerhub-username>"
    exit 1
fi

USERNAME=$1
IMAGE_NAME="runpod-python3.12"
TAG="latest"

echo "Building Docker image..."
docker build -t ${USERNAME}/${IMAGE_NAME}:${TAG} .

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "Image: ${USERNAME}/${IMAGE_NAME}:${TAG}"
    echo ""
    echo "To push to Docker Hub, run:"
    echo "docker login"
    echo "docker push ${USERNAME}/${IMAGE_NAME}:${TAG}"
else
    echo "Build failed!"
    exit 1
fi
