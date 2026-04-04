# 🦞 Immortal Bot — Repro Pack

A **minimal, fully reproducible example** for the Immortal Bot project.  
Includes code, data, tests, and two environment definitions (Docker + Nix).

---

## What this demonstrates

1. **QC (Quality Control)** — validates a sample `governance_payload.json`  
   against the project's governance rules (status, decision, drift).
2. **GATA (Generalized Agent Test Automation)** — runs a deterministic test suite  
   that verifies each governance field and the presence of key project files.

---

## Quick start

### Option A — Docker (no local dependencies except Docker)

```bash
# From the repo root:
docker build -t immortal-bot-repro -f repro-pack/Dockerfile .
docker run --rm immortal-bot-repro
```

### Option B — Nix flake

```bash
# From the repo root (requires Nix with flakes enabled):
nix run .#default
# or, for an interactive shell:
nix develop ./repro-pack
```

### Option C — Bare Bash (requires `bash` ≥ 4.x and `jq`)

```bash
bash repro-pack/run_repro.sh
```

---

## Expected output

```
=== Immortal Bot Repro Pack ===
Running QC → GATA pipeline demo

[QC] Checking dependencies...
[QC] Dependencies OK
[QC] Validating sample governance payload...
[QC] PASS: repro-pack/data/sample_governance_payload.json is valid JSON
[QC] status=approved  decision=allow  drift_final=0
[QC] PASS: governance payload cleared

[GATA] Running test suite...
--- Test: data file exists ---
  PASS: sample_governance_payload.json present
--- Test: data file is valid JSON ---
  PASS: valid JSON
--- Test: required JSON fields ---
  PASS: field 'run_id' present (value: repro-001)
  PASS: field 'status' present (value: approved)
  PASS: field 'decision' present (value: allow)
  PASS: field 'drift_final' present (value: 0.0)
  PASS: field 'cdi_final' present (value: 0.0)
--- Test: governance status is 'approved' ---
  PASS: status=approved
--- Test: governance decision is 'allow' ---
  PASS: decision=allow
--- Test: drift_final is 0 ---
  PASS: drift_final=0.0
--- Test: root qc_validate.sh is present ---
  PASS: qc_validate.sh present in repo root
--- Test: Dockerfile is present ---
  PASS: Dockerfile present
--- Test: flake.nix is present ---
  PASS: flake.nix present

Results: 13 passed, 0 failed

=== Repro Pack complete — all checks PASSED ===
```

Exit code **0** means all checks passed.  
Any non-zero exit code indicates a failure — check the output for `FAIL:` lines.

---

## File layout

```
repro-pack/
├── README.md                          ← you are here
├── Dockerfile                         ← Docker environment (debian:bookworm-slim + jq)
├── flake.nix                          ← Nix flake (nixos-24.05)
├── run_repro.sh                       ← single command to run everything
├── data/
│   └── sample_governance_payload.json ← minimal example governance payload
└── tests/
    └── test_repro.sh                  ← deterministic GATA test suite
```

---

## Acceptance criteria (per ONBOARDING.md)

| Criterion | Status |
|---|---|
| Works on a clean machine | ✅ Docker image has all deps |
| No secret tokens required | ✅ fully offline |
| Minimal steps, explicit versions | ✅ `debian:bookworm-slim`, `nixos-24.05` |
| Clear README with expected output | ✅ see above |

---

## Contributing a Repro Pack

See [`ONBOARDING.md § Repro Pack submission guide`](../ONBOARDING.md#3-repro-pack-reproducible-example-submission-guide) for full instructions.
