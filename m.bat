@echo off
chcp 65001 >nul
mode con: cols=100 lines=45
title Muconds - Modern Command Suite
color 0F
setlocal enabledelayedexpansion


for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set "color_title=%ESC%[38;5;39m"
set "color_menu=%ESC%[38;5;45m"
set "color_option=%ESC%[38;5;51m"
set "color_highlight=%ESC%[38;5;123m"
set "color_success=%ESC%[38;5;46m"
set "color_warning=%ESC%[38;5;226m"
set "color_error=%ESC%[38;5;196m"
set "color_reset=%ESC%[0m"

:main
cls
echo.
echo %color_title%  ███╗   ███╗██╗   ██╗ ██████╗ ██████╗ ███╗   ██╗██████╗ ███████╗
echo %color_title%  ████╗ ████║██║   ██║██╔════╝██╔═══██╗████╗  ██║██╔══██╗██╔════╝
echo %color_title%  ██╔████╔██║██║   ██║██║     ██║   ██║██╔██╗ ██║██║  ██║███████╗
echo %color_title%  ██║╚██╔╝██║██║   ██║██║     ██║   ██║██║╚██╗██║██║  ██║╚════██║
echo %color_title%  ██║ ╚═╝ ██║╚██████╔╝╚██████╗╚██████╔╝██║ ╚████║██████╔╝███████║
echo %color_title%  ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝  ╚════╝╚══════╝
echo %color_title%  ================================================================
echo %color_menu%  [1] Application Installer      [4] System Information
echo %color_menu%  [2] Network Utilities          [5] File Operations
echo %color_menu%  [3] System Maintenance         [6] Advanced Tools
echo %color_menu%  [0] Exit Muconds
echo %color_title%  ================================================================
echo.

choice /c 1234560 /n /m "%color_option%Select a module (1-6) or 0 to exit:%color_reset% "
if errorlevel 7 goto :eof
if errorlevel 6 goto :advanced
if errorlevel 5 goto :fileops
if errorlevel 4 goto :sysinfo
if errorlevel 3 goto :maintenance
if errorlevel 2 goto :network
if errorlevel 1 goto :installer

:installer
cls
echo.
echo %color_title%  MUCONDS APPLICATION INSTALLER
echo %color_title%  =============================
echo %color_menu%  [1] Install from Muconds Catalog
echo %color_menu%  [2] Install from Custom List
echo %color_menu%  [3] List Installed Apps
echo %color_menu%  [4] Uninstall Applications
echo %color_menu%  [0] Back to Main Menu
echo.

choice /c 12340 /n /m "%color_option%Select an option:%color_reset% "
if errorlevel 5 goto :main
if errorlevel 4 goto :uninstaller
if errorlevel 3 goto :listapps
if errorlevel 2 goto :custominstall
if errorlevel 1 goto :wingetinstall

:wingetinstall
cls
echo.
echo %color_title%  WINGET APPLICATION CATALOG
echo %color_title%  ==========================
set "APP_COUNT=0"
for /f "tokens=1,2 delims=|" %%a in (apps.txt) do (
    echo %color_option% [%%a] %%b
    set /a APP_COUNT+=1
)
echo %color_menu% [0] Back
echo.

set /p "choice=%color_option%Enter app number (1-%APP_COUNT%) or 0 to return:%color_reset% "
if "%choice%"=="0" goto :installer

for /f "tokens=1,2,3 delims=|" %%a in (apps.txt) do (
    if "%choice%"=="%%a" (
        echo %color_highlight%Installing %%b...%color_reset%
        winget install --id %%c -e --accept-package-agreements --accept-source-agreements
        if !errorlevel! equ 0 (
            echo %color_success%Installation completed successfully!%color_reset%
        ) else (
            echo %color_error%Installation failed!%color_reset%
        )
        pause
        goto :wingetinstall
    )
)
echo %color_error%Invalid selection!%color_reset%
pause
goto :wingetinstall

:custominstall
echo %color_warning%This feature is under development.%color_reset%
pause
goto :installer

:listapps
echo %color_warning%This feature is under development.%color_reset%
pause
goto :installer

:uninstaller
echo %color_warning%This feature is under development.%color_reset%
pause
goto :installer

:network
cls
echo.
echo %color_title%  NETWORK UTILITIES
echo %color_title%  =================
echo %color_menu%  [1] Network Diagnostics
echo %color_menu%  [2] Ping Tools
echo %color_menu%  [3] DNS Utilities
echo %color_menu%  [4] Port Scanner
echo %color_menu%  [0] Back to Main Menu
echo.

choice /c 12340 /n /m "%color_option%Select an option:%color_reset% "
if errorlevel 5 goto :main
if errorlevel 4 goto :portscan
if errorlevel 3 goto :dnsutils
if errorlevel 2 goto :pingtools
if errorlevel 1 goto :netdiag

:netdiag
ipconfig /all
pause
goto :network

:pingtools
set /p "target=%color_option%Enter IP/Domain to ping:%color_reset% "
ping %target%
pause
goto :network

:dnsutils
nslookup google.com
pause
goto :network

:portscan
echo %color_warning%Port scanner requires external tools (like nmap).%color_reset%
pause
goto :network

:maintenance
cls
echo.
echo %color_title%  SYSTEM MAINTENANCE
echo %color_title%  ==================
echo %color_menu%  [1] Disk Cleanup
echo %color_menu%  [2] Check Disk Errors
echo %color_menu%  [3] System File Checker
echo %color_menu%  [4] Performance Monitor
echo %color_menu%  [0] Back to Main Menu
echo.

choice /c 12340 /n /m "%color_option%Select an option:%color_reset% "
if errorlevel 5 goto :main
if errorlevel 4 goto :perfmon
if errorlevel 3 goto :sfc
if errorlevel 2 goto :chkdsk
if errorlevel 1 goto :cleanmgr

:cleanmgr
cleanmgr
pause
goto :maintenance

:chkdsk
echo %color_warning%Run CHKDSK on next reboot? (Y/N):%color_reset% 
choice /c YN /n
if errorlevel 2 goto :maintenance
chkdsk /f /r
echo %color_success%Scheduled for next boot.%color_reset%
pause
goto :maintenance

:sfc
sfc /scannow
pause
goto :maintenance

:perfmon
perfmon
goto :maintenance

:sysinfo
systeminfo
pause
goto :main

:fileops
cls
echo.
echo %color_title%  FILE OPERATIONS
echo %color_title%  ==============
echo %color_menu%  [1] Disk Usage Analyzer
echo %color_menu%  [2] Batch Rename Tool
echo %color_menu%  [3] File Search
echo %color_menu%  [4] Disk Cleanup
echo %color_menu%  [0] Back to Main Menu
echo.

choice /c 12340 /n /m "%color_option%Select an option:%color_reset% "
if errorlevel 5 goto :main
if errorlevel 4 goto :diskcleanup
if errorlevel 3 goto :filesearch
if errorlevel 2 goto :batchrename
if errorlevel 1 goto :diskusage

:diskusage
wmic logicaldisk get caption,size,freespace
pause
goto :fileops

:filesearch
set /p "query=%color_option%Enter search term:%color_reset% "
dir /s /b *%query%*
pause
goto :fileops

:batchrename
echo %color_warning%This feature is under development.%color_reset%
pause
goto :fileops

:diskcleanup
cleanmgr
goto :fileops

:advanced
cls
echo.
echo %color_title%  ADVANCED TOOLS
echo %color_title%  ==============
echo %color_menu%  [1] Process Manager
echo %color_menu%  [2] Service Manager
echo %color_menu%  [3] Registry Editor
echo %color_menu%  [4] Event Viewer
echo %color_menu%  [0] Back to Main Menu
echo.

choice /c 12340 /n /m "%color_option%Select an option:%color_reset% "
if errorlevel 5 goto :main
if errorlevel 4 goto :eventviewer
if errorlevel 3 goto :regedit
if errorlevel 2 goto :services
if errorlevel 1 goto :taskmanager

:taskmanager
tasklist
pause
goto :advanced

:services
net start
pause
goto :advanced

:regedit
regedit
goto :advanced

:eventviewer
eventvwr
goto :advanced

:eof
cls
echo.
echo %color_title%  Thank you for using Muconds!
echo %color_title%  ===========================
echo %color_menu%  Exiting modern command suite...
timeout /t 2 >nul
exit
