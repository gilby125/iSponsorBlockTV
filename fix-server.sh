#!/bin/bash

# Stop and remove existing container
docker stop iSponsorBlockTV 2>/dev/null
docker rm iSponsorBlockTV 2>/dev/null

# Create data directory
mkdir -p data

# Create valid config.json
cat > data/config.json << 'ENDOFCONFIG'
{
    "devices": [],
    "skip_categories": ["sponsor"],
    "skip_count_tracking": true,
    "mute_ads": true,
    "skip_ads": true,
    "channel_whitelist": []
}
ENDOFCONFIG

# Start fresh container
docker run -d \
    --name iSponsorBlockTV \
    --restart unless-stopped \
    -v $(pwd)/data:/app/data \
    ghcr.io/dmunozv04/isponsorblocktv

echo "Container started. Checking logs..."
sleep 3
docker logs iSponsorBlockTV --tail 10