@echo off
title Data Migration FTP Server
echo ======= MIGRATION DATA FTP SERVER =======
set /p ip="Enter IP address: "
echo --- Server information ---
echo %ip%
echo User: <username>
echo Password: *******
echo [INFO] Available process:
echo 1- Push Data
echo 2- Get data
set /p opt="Enter choice: "
:: Zipping data
echo [PROCESS] --- Compressing data ---
set zip="C:\Program Files\7-Zip\7z.exe"
set filename="<filename>.zip"
set pathtobackup="C:\Users\<folder_to_zip>"
%zip% a -t7z %filename% -r %pathtobackup%\*
if %opt%==1 (
:: Push data to server
echo [PROCESS] --- Push data to server ---
ftp -i -s:ftp_upload.txt -n %ip%
del %filename%
echo [INFO] Files Sended
) else (
:: Get data from server
echo [PROCESS] --- Get data from server ---
ftp -i -s:ftp_download.txt -n %ip%
del %filename%
echo [INFO] Data has been obtained
)
echo --- Done! ---
pause
