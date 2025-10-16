@echo off
title Create Local User + Fix OOBE Registry
color 0A
echo ============================================
echo   Local User Creation + OOBE Registry Fix
echo ============================================

:: --- USER CREATION ---
set /p username=Enter the username to create: 

if "%username%"=="" (
    echo [ERROR] Username cannot be empty.
    pause
    exit /b
)

echo.
echo Creating user "%username%" ...
net user "%username%" * /add
if errorlevel 1 (
    echo [ERROR] Failed to create user. Check if it already exists.
    pause
    exit /b
)

echo Adding "%username%" to Administrators group...
net localgroup administrators "%username%" /add

echo Activating user account...
net user "%username%" /active:yes
net user "%username%" /expires:never

echo Disabling built-in Administrator account...
net user "Administrator" /active:no

echo Deleting defaultUser0 (if exists)...
net user "defaultUser0" /delete >nul 2>&1

:: --- REMOVE defaultuser0 FOLDER IF POSSIBLE ---
set userfolder=C:\Users\defaultuser0
if exist "%userfolder%" (
    echo Attempting to remove leftover folder "%userfolder%" ...
    rmdir /s /q "%userfolder%" >nul 2>&1
)

echo.
echo ============================================
echo   User "%username%" created successfully.
echo ============================================

:: --- OOBE REGISTRY FIX ---
echo.
echo Fixing OOBE registry entries...
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v DefaultAccountAction /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v DefaultAccountSAMName /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v DefaultAccountSID /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v LaunchUserOOBE /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v SkipMachineOOBE /t REG_DWORD /d 1 /f >nul 2>&1

:: --- SKIP COMPUTER NAME PROMPT ---
echo Disabling computer name prompt during OOBE...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v HideComputerName /t REG_DWORD /d 1 /f >nul 2>&1

echo Registry keys fixed successfully.

:: --- SCHEDULE CLEANUP AFTER REBOOT ---
echo Scheduling removal of leftover defaultuser0 folder on next boot...
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v DeleteDefaultUser0 /t REG_SZ /d "cmd.exe /c if exist C:\Users\defaultuser0 rmdir /s /q C:\Users\defaultuser0" /f >nul 2>&1

:: --- RESTART SYSTEM ---
echo.
echo ============================================
echo The system will restart in 3 seconds...
echo ============================================
timeout /t 3 >nul

shutdown /r /t 0
