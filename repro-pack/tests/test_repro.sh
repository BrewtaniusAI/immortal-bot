#!/usr/bin/env bash
# test_repro.sh — deterministic test suite for the Immortal Bot Repro Pack
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACK_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
ROOT_DIR="$(cd "$PACK_DIR/.." && pwd)"

PASS=0
FAIL=0

pass() { echo "  PASS: $1"; PASS=$((PASS + 1)); }
fail() { echo "  FAIL: $1"; FAIL=$((FAIL + 1)); }

echo "--- Test: data file exists ---"
[[ -f "$PACK_DIR/data/sample_governance_payload.json" ]] \
  && pass "sample_governance_payload.json present" \
  || fail "sample_governance_payload.json missing"

echo "--- Test: data file is valid JSON ---"
jq empty "$PACK_DIR/data/sample_governance_payload.json" 2>/dev/null \
  && pass "valid JSON" \
  || fail "invalid JSON"

echo "--- Test: required JSON fields ---"
for field in run_id status decision drift_final cdi_final; do
  VALUE=$(jq -r ".$field // empty" "$PACK_DIR/data/sample_governance_payload.json")
  [[ -n "$VALUE" ]] \
    && pass "field '$field' present (value: $VALUE)" \
    || fail "field '$field' missing or null"
done

echo "--- Test: governance status is 'approved' ---"
STATUS=$(jq -r '.status' "$PACK_DIR/data/sample_governance_payload.json")
[[ "$STATUS" == "approved" ]] \
  && pass "status=approved" \
  || fail "status='$STATUS' (expected 'approved')"

echo "--- Test: governance decision is 'allow' ---"
DECISION=$(jq -r '.decision' "$PACK_DIR/data/sample_governance_payload.json")
[[ "$DECISION" == "allow" ]] \
  && pass "decision=allow" \
  || fail "decision='$DECISION' (expected 'allow')"

echo "--- Test: drift_final is 0 ---"
DRIFT=$(jq -r '.drift_final' "$PACK_DIR/data/sample_governance_payload.json")
[[ "$DRIFT" == "0" || "$DRIFT" == "0.0" ]] \
  && pass "drift_final=$DRIFT" \
  || fail "drift_final='$DRIFT' (expected 0 or 0.0)"

echo "--- Test: root qc_validate.sh is present ---"
# When running in Docker the script is placed at /repo-root/qc_validate.sh;
# when running locally it lives at the repository root.
if [[ -f "$ROOT_DIR/qc_validate.sh" || -f "/repo-root/qc_validate.sh" ]]; then
  pass "qc_validate.sh present"
else
  fail "qc_validate.sh not found (checked $ROOT_DIR/qc_validate.sh and /repo-root/qc_validate.sh)"
fi

echo "--- Test: Dockerfile is present ---"
[[ -f "$PACK_DIR/Dockerfile" ]] \
  && pass "Dockerfile present" \
  || fail "Dockerfile missing"

echo "--- Test: flake.nix is present ---"
[[ -f "$PACK_DIR/flake.nix" ]] \
  && pass "flake.nix present" \
  || fail "flake.nix missing"

echo ""
echo "Results: $PASS passed, $FAIL failed"
if [[ "$FAIL" -gt 0 ]]; then
  exit 1
fi
