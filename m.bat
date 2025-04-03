@echo off
chcp 65001 >nul
mode con: cols=90 lines=40
color 0A

:: Set Colors and Styles
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set "color_title=%ESC%[38;5;45m"
set "color_menu=%ESC%[38;5;51m"
set "color_option=%ESC%[38;5;120m"
set "color_highlight=%ESC%[38;5;226m"
set "color_progress=%ESC%[38;5;39m"
set "color_reset=%ESC%[0m"

:: Display Title and Logo
cls
echo.
echo %color_title% ███╗   ███╗██╗   ██╗ ██████╗ ██████╗ ███╗   ██╗██████╗ ███████╗
echo %color_title% ████╗ ████║██║   ██║██╔════╝██╔═══██╗████╗  ██║██╔══██╗██╔════╝
echo %color_title% ██╔████╔██║██║   ██║██║     ██║   ██║██╔██╗ ██║██║  ██║███████╗
echo %color_title% ██║╚██╔╝██║██║   ██║██║     ██║   ██║██║╚██╗██║██║  ██║╚════██║
echo %color_title% ██║ ╚═╝ ██║╚██████╔╝╚██████╗╚██████╔╝██║ ╚████║██████╔╝███████║
echo %color_title% ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝
echo.
echo %color_menu% Modern Installer Script by PlanBCode - Select an application to install or type "help <number>" for details

:: Application List (Now with 44+ apps)
echo 1. Google Chrome
echo 2. Mozilla Firefox
echo 3. VLC Media Player
echo 4. 7-Zip
echo 5. Notepad++
echo 6. Spotify
echo 7. Discord
echo 8. Steam
echo 9. Visual Studio Code
echo 10. Python
echo 11. Java Runtime Environment (JRE)
echo 12. Git
echo 13. Node.js
echo 14. Docker Desktop
echo 15. Adobe Acrobat Reader
echo 16. GIMP
echo 17. Blender
echo 18. LibreOffice
echo 19. OBS Studio
echo 20. Zoom
echo 21. Skype
echo 22. WhatsApp
echo 23. Teamspeak
echo 24. Epic Games Launcher
echo 25. Minecraft Launcher
echo 26. VLC (Beta Version)
echo 27. Slack
echo 28. Notepad2
echo 29. WinRAR
echo 30. VirtualBox
echo 31. Krita
echo 32. Postman
echo 33. MySQL Workbench
echo 34. Trello
echo 35. FileZilla
echo 36. Apache
echo 37. Nginx
echo 38. Wireshark
echo 39. Eclipse
echo 40. Docker
echo 41. Vagrant
echo 42. VMware
echo 43. Jenkins
echo 44. Anaconda
echo 45. Exit
echo.

:: Get User Input for Application Selection or Help
set /p choice="Enter your choice (1-45 or 'help <number>'): "

:: Check for help command
for /f "tokens=1,*" %%a in ("%choice%") do (
    if "%%a"=="help" (
        call :displayHelp %%b
        goto :eof
    )
)

:: Application Installation Commands
if "%choice%"=="1" winget install --id=Google.Chrome -e
if "%choice%"=="2" winget install --id=Mozilla.Firefox -e
if "%choice%"=="3" winget install --id=VideoLAN.VLC -e
if "%choice%"=="4" winget install --id=7zip.7zip -e
if "%choice%"=="5" winget install --id=Notepad++.Notepad++ -e
if "%choice%"=="6" winget install --id=Spotify.Spotify -e
if "%choice%"=="7" winget install --id=Discord.Discord -e
if "%choice%"=="8" winget install --id=Valve.Steam -e
if "%choice%"=="9" winget install --id=Microsoft.VisualStudioCode -e
if "%choice%"=="10" winget install --id=Python.Python.3 -e
if "%choice%"=="11" winget install --id=Oracle.JavaRuntimeEnvironment -e
if "%choice%"=="12" winget install --id=Git.Git -e
if "%choice%"=="13" winget install --id=OpenJS.NodeJS -e
if "%choice%"=="14" winget install --id=Docker.DockerDesktop -e
if "%choice%"=="15" winget install --id=Adobe.Acrobat.Reader.64-bit -e
if "%choice%"=="16" winget install --id=GIMP.GIMP -e
if "%choice%"=="17" winget install --id=BlenderFoundation.Blender -e
if "%choice%"=="18" winget install --id=TheDocumentFoundation.LibreOffice -e
if "%choice%"=="19" winget install --id=OBSProject.OBSStudio -e
if "%choice%"=="20" winget install --id=Zoom.Zoom -e
if "%choice%"=="21" winget install --id=Skype.Skype -e
if "%choice%"=="22" winget install --id=WhatsApp.WhatsApp -e
if "%choice%"=="23" winget install --id=TeamSpeak.TeamSpeak -e
if "%choice%"=="24" winget install --id=EpicGames.EpicGamesLauncher -e
if "%choice%"=="25" winget install --id=Mojang.MinecraftLauncher -e
if "%choice%"=="26" winget install --id=VideoLAN.VLC.Beta -e
if "%choice%"=="27" winget install --id=Slack.Slack -e
if "%choice%"=="28" winget install --id=Notepad2.Notepad2 -e
if "%choice%"=="29" winget install --id=WinRAR.WinRAR -e
if "%choice%"=="30" winget install --id=Oracle.VirtualBox -e
if "%choice%"=="31" winget install --id=Krita.Krita -e
if "%choice%"=="32" winget install --id=Postman.Postman -e
if "%choice%"=="33" winget install --id=MySQL.MySQLWorkbench -e
if "%choice%"=="34" winget install --id=Trello.Trello -e
if "%choice%"=="35" winget install --id=FileZilla.FileZilla -e
if "%choice%"=="36" winget install --id=Apache.Apache -e
if "%choice%"=="37" winget install --id=Nginx.Nginx -e
if "%choice%"=="38" winget install --id=Wireshark.Wireshark -e
if "%choice%"=="39" winget install --id=EclipseFoundation.Eclipse -e
if "%choice%"=="40" winget install --id=Docker.Docker -e
if "%choice%"=="41" winget install --id=Vagrant.Vagrant -e
if "%choice%"=="42" winget install --id=VMware.VMware -e
if "%choice%"=="43" winget install --id=Jenkins.Jenkins -e
if "%choice%"=="44" winget install --id=Anaconda.Anaconda -e
if "%choice%"=="45" exit


:: Invalid Choice Handling
echo.
echo %color_highlight%Invalid choice. Please enter a valid number or 'help <number>' for more info.%color_reset%
pause
goto :eof

:: Help Function
:displayHelp
setlocal
set app_num=%1
if "%app_num%"=="1" echo Google Chrome: A fast, secure, and free web browser.
if "%app_num%"=="2" echo Mozilla Firefox: Open-source web browser known for privacy.
if "%app_num%"=="3" echo VLC Media Player: A versatile multimedia player supporting many formats.
if "%app_num%"=="4" echo 7-Zip: A free, open-source file archiver with high compression rates.
if "%app_num%"=="5" echo Notepad++: A text editor for coding with many features and plugins.
if "%app_num%"=="6" echo Spotify: A music streaming service with millions of songs.
if "%app_num%"=="7" echo Discord: A chat app for gamers, supporting voice and text.
if "%app_num%"=="8" echo Steam: A gaming platform with multiplayer functionality and game distribution.
if "%app_num%"=="9" echo Visual Studio Code: A powerful code editor for web and software development.
if "%app_num%"=="10" echo Python: A programming language used for web, automation, data analysis, and more.
if "%app_num%"=="11" echo Java Runtime Environment: A package for running Java applications.
if "%app_num%"=="12" echo Git: A version control system for managing code changes.
if "%app_num%"=="13" echo Node.js: JavaScript runtime for building server-side applications.
if "%app_num%"=="14" echo Docker Desktop: A tool for developing and running applications in containers.
if "%app_num%"=="15" echo Adobe Acrobat Reader: A reader for PDF files.
if "%app_num%"=="16" echo GIMP: A free image editor for tasks such as photo retouching.
if "%app_num%"=="17" echo Blender: A free 3D creation suite for modeling, animation, and rendering.
if "%app_num%"=="18" echo LibreOffice: A free office suite for word processing, spreadsheets, and presentations.
if "%app_num%"=="19" echo OBS Studio: Open-source software for video recording and streaming.
if "%app_num%"=="20" echo Zoom: A video conferencing app for meetings and webinars.
if "%app_num%"=="21" echo Skype: A communication app offering voice and video calls, along with instant messaging.
if "%app_num%"=="22" echo WhatsApp: A messaging app that supports text, voice, and video communication.
if "%app_num%"=="23" echo Teamspeak: A voice communication platform for online gaming.
if "%app_num%"=="24" echo Epic Games Launcher: A platform to download and play Epic Games titles.
if "%app_num%"=="25" echo Minecraft Launcher: A launcher to start and manage Minecraft games.
if "%app_num%"=="26" echo VLC (Beta Version): An advanced version of VLC with experimental features.
if "%app_num%"=="27" echo Slack: A collaboration tool for team messaging, file sharing, and more.
if "%app_num%"=="28" echo Notepad2: A lightweight text editor for source code and plain text.
if "%app_num%"=="29" echo WinRAR: A popular file archiver and decompressor supporting multiple formats.
if "%app_num%"=="30" echo VirtualBox: A tool for creating and managing virtual machines.
if "%app_num%"=="31" echo Krita: A free painting program for illustrators, concept artists, and digital painters.
if "%app_num%"=="32" echo Postman: A popular tool for testing and developing APIs.
if "%app_num%"=="33" echo MySQL Workbench: A tool for managing MySQL databases with a graphical interface.
if "%app_num%"=="34" echo Trello: A project management tool with boards, lists, and cards for organizing tasks.
if "%app_num%"=="35" echo FileZilla: A free, open-source FTP and SFTP client for file transfers.
if "%app_num%"=="36" echo Apache: A widely-used web server software for hosting websites.
if "%app_num%"=="37" echo Nginx: A high-performance web server and reverse proxy server.
if "%app_num%"=="38" echo Wireshark: A network protocol analyzer used for network troubleshooting and analysis.
if "%app_num%"=="39" echo Eclipse: An integrated development environment (IDE) for Java development and more.
if "%app_num%"=="40" echo Docker: A platform for developing, shipping, and running applications in containers.
if "%app_num%"=="41" echo Vagrant: A tool for managing virtual development environments.
if "%app_num%"=="42" echo VMware: A virtualization software for running virtual machines on your computer.
if "%app_num%"=="43" echo Jenkins: An open-source automation server for continuous integration and delivery.
if "%app_num%"=="44" echo Anaconda: A Python distribution for data science, machine learning, and scientific computing.
endlocal
pause
goto :eof
