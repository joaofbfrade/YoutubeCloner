@echo off
title YoutubeCloner

:menu
cls

echo =========================================
echo          @YoutubeCloner by xs0ched
echo =========================================
echo 1. Download audios
echo 2. Download thumbnails
echo 3. Download video titles
echo 4. Download all videos from channel
echo 5. Exit
echo ==============================
set /p choice=Choose an option (1-5):

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="4" goto option4
if "%choice%"=="5" goto exit
echo Invalid choice. Please select a number from 1 to 5.
pause
goto menu

:option1
cls
echo =========================================
echo           Download Audios
echo =========================================
set /p channelname=Paste YouTube channel link: 
echo Channel link: %channelname%
yt-dlp --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist %channelname%
pause
goto menu

:option2
cls
echo =========================================
echo           Download Thumbnails
echo =========================================
set /p channelname=Paste YouTube channel link: 
echo Channel link: %channelname%
yt-dlp  --ignore-errors --write-thumbnail --skip-download --yes-playlist %channelname%
pause
goto menu

:option3
cls
echo =========================================
echo           Download Video Titles
echo =========================================
set /p channelname=Paste YouTube channel link: 
echo Channel link: %channelname%
yt-dlp --ignore-errors --flat-playlist --print "%%(title)s" %channelname%
echo Video titles have been saved to video_titles.txt
pause
goto menu

:option4
cls
echo =========================================
echo      Download all videos from channel
echo =========================================
set /p channelname=Paste YouTube channel link: 
echo Channel link: %channelname%
yt-dlp --ignore-errors --format best --output "%(title)s.%(ext)s" --yes-playlist %channelname%
pause
goto menu

:exit
echo Exiting...
pause
exit
