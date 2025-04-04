@echo off
chcp 65001 >nul
mode con: cols=90 lines=40
color 0A
setlocal enabledelayedexpansion

for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set "color_title=%ESC%[38;5;45m"
set "color_menu=%ESC%[38;5;51m"
set "color_option=%ESC%[38;5;120m"
set "color_highlight=%ESC%[38;5;226m"
set "color_reset=%ESC%[0m"

cls
echo.
echo %color_title% ███╗   ███╗██╗   ██╗ ██████╗ ██████╗ ███╗   ██╗██████╗ ███████╗
echo %color_title% ████╗ ████║██║   ██║██╔════╝██╔═══██╗████╗  ██║██╔══██╗██╔════╝
echo %color_title% ██╔████╔██║██║   ██║██║     ██║   ██║██╔██╗ ██║██║  ██║███████╗
echo %color_title% ██║╚██╔╝██║██║   ██║██║     ██║   ██║██║╚██╗██║██║  ██║╚════██║
echo %color_title% ██║ ╚═╝ ██║╚██████╔╝╚██████╗╚██████╔╝██║ ╚████║██████╔╝███████║
echo %color_title% ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝
echo.
echo %color_menu%Modern Installer Script by PlanBCode - Select an application to install

set "APP_COUNT=0"
for /f "tokens=1,2 delims=|" %%a in (apps.txt) do (
    echo %%a. %%b
    set /a APP_COUNT+=1
)

echo 53. Exit
echo.

set /p choice="Enter your choice (1-%APP_COUNT%): "

for /f "tokens=1,*" %%a in ("%choice%") do (
    if "%%a"=="help" (
        call :displayHelp %%b
        goto :eof
    )
)

for /f "tokens=1,2,3 delims=|" %%a in (apps.txt) do (
    if "%choice%"=="%%a" (
        echo Installing %%b...
        winget install --id=%%c -e
        goto :eof
    )
)

if "%choice%"=="53" exit

echo.
echo %color_highlight%Invalid choice. Please try again.%color_reset%
pause
goto :eof
