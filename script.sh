#!/usr/bin/env bash
set -euo pipefail

# Define long image names with readable labels
IMAGE1="ghcr.io/hrdwasnetskydockim0539xzref/newdocvhh65hvwbjvj87hchf42j768vjht542bj84bjbitanetskey0539:001-of-one"
IMAGE2="ghcr.io/hrdwasnetskydockim0539xzref/newdocvhh65hvwbjvj87hchf42j768vjht542bj84bjbitbnetskey0539:001-of-two"
IMAGE3="ghcr.io/hrdwasnetskydockim0539xzref/newdocvhh65hvwbjvj87hchf42j768vjht542bj84bjbitbnetskey0539:001-of-two"

# Put them into an array in order
IMAGES=("$IMAGE1" "$IMAGE2" "$IMAGE3")

# Get today's day number (1–366)
DAY_NUMBER=$(date +%j)

# Compute index so Day 1 → IMAGE1, Day 2 → IMAGE2, Day 3 → IMAGE3
INDEX=$(( (DAY_NUMBER - 1) % ${#IMAGES[@]} ))

# Pick the image
SELECTED_IMAGE=${IMAGES[$INDEX]}

echo "-----------------------------------"
echo " Date: $(date)"
echo " Day number: $DAY_NUMBER"
echo " Selected Docker image: $SELECTED_IMAGE"
echo "-----------------------------------"

# Pull and run the container with your preferred flags
docker pull "$SELECTED_IMAGE"
docker run --rm \
  -i --shm-size 4g \
  -e MIN_SLEEP_MINUTES=1 \
  -e MAX_SLEEP_MINUTES=2 \
  "$SELECTED_IMAGE"
