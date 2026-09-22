@echo off
REM Build script for Shravan Chandra's personal website (Windows)
REM Double-click this file in File Explorer to run it.

cd /d "%~dp0"

echo ==============================================
echo  Building personal website
echo ==============================================

echo.
echo [1/5] Installing Python dependencies (uv sync)...
call uv sync
if errorlevel 1 goto :error

echo.
echo [2/5] Installing R dependencies (renv::restore)...
call Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore(prompt = FALSE)"
if errorlevel 1 goto :error

echo.
echo [3/5] Activating Python virtual environment (.venv\Scripts\activate.bat)...
call .venv\Scripts\activate.bat
if errorlevel 1 goto :error

echo.
echo [4/5] Rendering site (quarto render)...
call uv run quarto render
if errorlevel 1 goto :error

echo.
echo [5/5] Starting local preview (quarto preview)...
echo Press Ctrl+C in this window to stop the preview server.
call uv run quarto preview

goto :end

:error
echo.
echo Something went wrong. See the messages above for details.

:end
echo.
pause
