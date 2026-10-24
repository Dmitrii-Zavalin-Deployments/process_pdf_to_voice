#!/bin/bash
set -e

# Set environment variables from GitHub Actions secrets
APP_KEY=${APP_KEY}
APP_SECRET=${APP_SECRET}
REFRESH_TOKEN=${REFRESH_TOKEN}
LOCAL_FOLDER="./downloaded_pdfs" # Set your local folder
LOG_FILE="./action_log.txt"

# Read dropbox_folder dynamically from config.json (with fallback)
CONFIG_FILE="config.json"
if [ -f "$CONFIG_FILE" ]; then
    DROPBOX_FOLDER=$(python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('dropbox_folder', '/Exchange/pdf_to_voice'))")
else
    DROPBOX_FOLDER="/Exchange/pdf_to_voice"
fi

echo "Using Dropbox folder: $DROPBOX_FOLDER"

# Create the local folder if it doesn't exist
mkdir -p $LOCAL_FOLDER

echo "------------------------------------------------------------"
echo "Step 1: Downloading PDFs from Dropbox..."
echo "------------------------------------------------------------"
python3 download_from_dropbox.py "$DROPBOX_FOLDER" "$LOCAL_FOLDER" "$REFRESH_TOKEN" "$APP_KEY" "$APP_SECRET" "$LOG_FILE"

echo ""
echo "------------------------------------------------------------"
echo "Step 2: Processing PDFs into Natural Speech Audio via Kokoro..."
echo "------------------------------------------------------------"
# Run the processing/conversion script
if [ -x ./process_downloaded_pdfs.sh ]; then
    ./process_downloaded_pdfs.sh
else
    echo "ERROR: process_downloaded_pdfs.sh is not found or not executable."
    exit 1
fi

echo ""
echo "------------------------------------------------------------"
echo "Step 3: Uploading generated audio files back to Dropbox..."
echo "------------------------------------------------------------"
# Run the upload script to send generated audio tracks (.wav) back to Dropbox
if [ -f ./upload_to_dropbox.py ]; then
    python3 upload_to_dropbox.py "$REFRESH_TOKEN" "$APP_KEY" "$APP_SECRET"
else
    echo "ERROR: upload_to_dropbox.py is not found."
    exit 1
fi

echo ""
echo "------------------------------------------------------------"
echo "Pipeline execution completed successfully!"
echo "------------------------------------------------------------"