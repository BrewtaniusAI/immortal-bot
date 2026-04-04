#!/usr/bin/env bash
# run_repro.sh — single entry-point for the Immortal Bot Repro Pack
# Expected output: all checks PASS and exit code 0
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DATA_FILE="$SCRIPT_DIR/data/sample_governance_payload.json"

echo "=== Immortal Bot Repro Pack ==="
echo "Running QC → GATA pipeline demo"
echo ""

# ── Step 1: QC – validate the governance payload ──────────────────────────────
echo "[QC] Checking dependencies..."
for dep in bash jq; do
  command -v "$dep" >/dev/null 2>&1 || { echo "ERROR: '$dep' not found"; exit 1; }
done
echo "[QC] Dependencies OK"

echo "[QC] Validating sample governance payload..."
if jq empty "$DATA_FILE" 2>/dev/null; then
  echo "[QC] PASS: $DATA_FILE is valid JSON"
else
  echo "[QC] FAIL: $DATA_FILE is not valid JSON"
  exit 1
fi

STATUS=$(jq -r '.status' "$DATA_FILE")
DECISION=$(jq -r '.decision' "$DATA_FILE")
DRIFT=$(jq -r '.drift_final' "$DATA_FILE")

echo "[QC] status=$STATUS  decision=$DECISION  drift_final=$DRIFT"
if [[ "$STATUS" == "approved" && "$DECISION" == "allow" ]]; then
  echo "[QC] PASS: governance payload cleared"
else
  echo "[QC] FAIL: unexpected status/decision values"
  exit 1
fi

# ── Step 2: GATA – run automated tests ────────────────────────────────────────
echo ""
echo "[GATA] Running test suite..."
bash "$SCRIPT_DIR/tests/test_repro.sh"

echo ""
echo "=== Repro Pack complete — all checks PASSED ==="
