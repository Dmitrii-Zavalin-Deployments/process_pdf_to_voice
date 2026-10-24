import dropbox
import json
import os
import requests
import sys

# Function to refresh the access token
def refresh_access_token(refresh_token, client_id, client_secret):
    url = "https://api.dropbox.com/oauth2/token"
    data = {
        "grant_type": "refresh_token",
        "refresh_token": refresh_token,
        "client_id": client_id,
        "client_secret": client_secret
    }
    response = requests.post(url, data=data)
    if response.status_code == 200:
        return response.json()["access_token"]
    else:
        raise Exception("Failed to refresh access token")

# Function to upload a file to Dropbox
def upload_file_to_dropbox(local_file_path, dropbox_file_path, refresh_token, client_id, client_secret):
    # Refresh the access token
    access_token = refresh_access_token(refresh_token, client_id, client_secret)
    dbx = dropbox.Dropbox(access_token)

    try:
        with open(local_file_path, "rb") as f:
            dbx.files_upload(f.read(), dropbox_file_path, mode=dropbox.files.WriteMode.overwrite)
        print(f"Uploaded file to Dropbox: {dropbox_file_path}")
    except Exception as e:
        print(f"Failed to upload file to Dropbox: {e}")

# Entry point for the script
if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python upload_to_dropbox.py <refresh_token> <client_id> <client_secret>")
        sys.exit(1)

    # Command-line arguments
    audio_directory = "./downloaded_pdfs/audio_output"  # Path containing generated .wav files
    refresh_token = sys.argv[1]                         # Dropbox refresh token
    client_id = sys.argv[2]                             # Dropbox client ID
    client_secret = sys.argv[3]                         # Dropbox client secret

    # Read dropbox_folder dynamically from config.json (with fallback)
    config_path = "config.json"
    dropbox_folder = "/Exchange/pdf_to_voice"
    if os.path.exists(config_path):
        try:
            with open(config_path, "r", encoding="utf-8") as f:
                config = json.load(f)
                dropbox_folder = config.get("dropbox_folder", dropbox_folder)
        except Exception as e:
            print(f"Warning: Could not read {config_path} for upload destination ({e}), using default: {dropbox_folder}")

    # Check if the local audio directory exists
    if not os.path.isdir(audio_directory):
        print(f"Directory {audio_directory} does not exist. Please ensure audio has been generated.")
        sys.exit(1)

    uploaded_count = 0

    # Iterate through all .wav audio files in the directory and upload them
    for file_name in os.listdir(audio_directory):
        if file_name.endswith(".wav"):
            local_file_path = os.path.join(audio_directory, file_name)
            dropbox_file_path = f"{dropbox_folder}/{file_name}"

            # Call the upload function for each audio track
            upload_file_to_dropbox(local_file_path, dropbox_file_path, refresh_token, client_id, client_secret)
            uploaded_count += 1

    if uploaded_count > 0:
        print(f"All {uploaded_count} natural speech audio .wav files have been uploaded to Dropbox!")
    else:
        print("No .wav audio files found to upload.")