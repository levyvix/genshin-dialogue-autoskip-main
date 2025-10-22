@echo off
pushd "%~dp0"

echo Checking for uv...

:: Check if uv is installed
where uv >nul 2>nul
if %errorlevel% equ 0 (
    echo uv found! Running script...
    echo.
    uv run autoskip_dialogue.py
    goto end
)

echo uv not found. Installing uv...
echo.

:: Try pip first
pip --version >nul 2>nul
if %errorlevel% equ 0 (
    echo Installing uv with pip...
    pip install uv
    if %errorlevel% equ 0 (
        echo uv installed successfully!
        echo Running script...
        echo.
        uv run autoskip_dialogue.py
        goto end
    )
)

:: Try pip3 if pip failed
pip3 --version >nul 2>nul
if %errorlevel% equ 0 (
    echo Installing uv with pip3...
    pip3 install uv
    if %errorlevel% equ 0 (
        echo uv installed successfully!
        echo Running script...
        echo.
        uv run autoskip_dialogue.py
        goto end
    )
)

:: If both failed
echo.
echo ERROR: Could not install uv. Please install Python and pip first.
echo Visit: https://www.python.org/downloads/
echo.
goto end

:end
@pause
