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
echo "[1/4] Installing Python dependencies (uv sync)..."
uv sync

echo ""
echo "[2/4] Installing R dependencies (renv::restore)..."
Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore(prompt = FALSE)"

echo ""
echo "[3/4] Rendering site (quarto render)..."
uv run quarto render

echo ""
echo "[4/4] Starting local preview (quarto preview)..."
echo "Press Ctrl+C in this window to stop the preview server."
uv run quarto preview

echo ""
echo "Done. Press Enter to close this window..."
read
