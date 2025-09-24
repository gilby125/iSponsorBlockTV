#!/bin/bash

# Create Docker volume
echo "Creating Docker volume..."
docker volume create isponsorblocktv_data

# Create config.json in the volume
echo "Creating config file..."
docker run --rm -v isponsorblocktv_data:/data alpine sh -c 'cat > /data/config.json << "EOF"
{
  "devices": [
    {
      "screen_id": "519127775541",
      "name": "office_onn"
    }
  ],
  "skip_categories": ["sponsor", "intro", "outro", "selfpromo", "preview", "interaction"],
  "channel_whitelist": [],
  "skip_count_tracking": true,
  "mute_ads": true,
  "skip_ads": true
}
EOF'

echo "Config created successfully!"
echo "Now run: docker-compose up -d"