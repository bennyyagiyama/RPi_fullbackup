#!/bin/bash
# バックアップを作成するスクリプト

REMOTE_USER="your_username"
REMOTE_SERVER="your_server_address"
REMOTE_HOST=$REMOTE_USER@$REMOTE_SERVER
REMOTE_DIR="/path/to/remote/backup/directory"

DEVNAME="mmcblk0"
HOSTNAME=$(hostname -s)
BACKUPNAME="$HOSTNAME.$DEVNAME"

# 既存のバックアップをリネーム
ssh $REMOTE_HOST "mv $REMOTE_DIR/$BACKUPNAME.2.img.gz $REMOTE_DIR/$BACKUPNAME.3.img.gz"
ssh $REMOTE_HOST "mv $REMOTE_DIR/$BACKUPNAME.1.img.gz $REMOTE_DIR/$BACKUPNAME.2.img.gz"
ssh $REMOTE_HOST "mv $REMOTE_DIR/$BACKUPNAME.0.img.gz $REMOTE_DIR/$BACKUPNAME.1.img.gz"
ssh $REMOTE_HOST "mv $REMOTE_DIR/$BACKUPNAME.img.gz   $REMOTE_DIR/$BACKUPNAME.0.img.gz"

# RPiのバックアップを作成し、リモートに保存する
dd if="/dev/$DEVNAME" conv=sync,noerror bs=64k | gzip -c -9 | ssh $REMOTE_USER@$REMOTE_SERVER "cat > $REMOTE_DIR/$BACKUPNAME.img.gz"


