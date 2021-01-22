#!/bin/sh
SERVER_PATH='/home/<username>/'
echo '======= FTP SERVER ACTIONS ======='
echo 'Choose the option you want to make:'
echo '1- Upload data'
echo '2- Get data to local folder'
read option
if [ "$option" = "1" ]; then
  FILES_PATH='/home/<files_path>/*'
  echo '======= UPLOADING LOCAL DATA ======='
  echo '[INFO] ... Data to upload: ...'
  ls $FILES_PATH
  echo '[PROCESS] ... Uploading Data ...'
  cp -r $FILES_PATH $SERVER_PATH
  echo '[INFO] ... Data uploaded ...'
fi
if [ "$option" = "2" ]; then
  echo '======= GET DATA ======='
  echo '[INFO] ... Enter your username: ...'
  read username
  echo '[INFO] ... Enter target path: ...'
  read target_path
  cp -r $SERVER_PATH* $target_path
  echo '[PROCESS] ... Getting Data ...'
  chown -R $username $target_path
  echo '[INFO] ... Data obtained in ...'
  echo $target_path
  echo '[INFO] ... The content of the folder is: ...'
  ls $target_path
fi
