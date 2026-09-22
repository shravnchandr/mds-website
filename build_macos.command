#!/bin/bash
# Build script for Shravan Chandra's personal website (macOS)
# Double-click this file in Finder to run it.

set -e

# Move to the directory this script lives in (the repo root)
cd "$(dirname "$0")"

echo "=============================================="
echo " Building personal website"
echo "=============================================="

echo ""
echo "[1/5] Installing Python dependencies (uv sync)..."
uv sync

echo ""
echo "[2/5] Installing R dependencies (renv::restore)..."
Rscript setup.R

echo ""
echo "[3/5] Activating Python virtual environment (source .venv/bin/activate)..."
source .venv/bin/activate

echo ""
echo "[4/5] Rendering site (quarto render)..."
quarto render

echo ""
echo "[5/5] Starting local preview (quarto preview)..."
echo "Press Ctrl+C in this window to stop the preview server."
quarto preview

echo ""
echo "Done. Press Enter to close this window..."
read
