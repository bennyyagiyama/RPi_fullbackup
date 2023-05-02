# RPi_fullbackup

This script creates a full backup of your Raspberry Pi and saves it remotely.

## Requirements

- A Raspberry Pi running Linux
- `ssh` and `gzip` utilities installed
- Remote backup directory accessible via SSH

## Usage

1. Edit the `REMOTE_USER`, `REMOTE_SERVER`, and `REMOTE_DIR` variables to reflect your remote backup directory location and login credentials.
2. Run the script on your Raspberry Pi: `sudo ./backup.sh`

The script will create a backup of your entire Raspberry Pi system and save it remotely in your specified directory.

## Backup Naming Convention

The backups are named according to the following convention: `HOSTNAME.DEVICE_NAME.X.img.gz`, where:

- `HOSTNAME` is the hostname of your Raspberry Pi
- `DEVICE_NAME` is the name of the device you are backing up (usually `mmcblk0` for the Raspberry Pi's SD card)
- `X` is an incremental backup number (0-3) to keep track of previous backups

## License

This script is licensed under the [MIT License](LICENSE).

## Author

Written by [Your Name Here](https://github.com/yourusername).
