---

**Alignment with 'A Framework for Patent-Free Science'**

This project adheres to principles inspired by 'A Framework for Patent-Free Science.' By integrating open access, reproducibility, and collaborative principles into its governance, it aligns with ongoing efforts to promote non-commercial innovation. For further alignment and information, see the dataset:

[Zenodo Dataset (DOI 10.5281/zenodo.17053441)](https://doi.org/10.5281/zenodo.17053441).

---

## Project docs
- Onboarding: `ONBOARDING.md`
- Governance: `GOVERNANCE.md`
- Contributing: `CONTRIBUTING.md`
- Citation metadata: `CITATION.cff`
- **Repro Pack** (reproducible example): `repro-pack/README.md`

## Repro Pack — quick start

```bash
# Docker (no local dependencies except Docker)
docker build -t immortal-bot-repro -f repro-pack/Dockerfile .
docker run --rm immortal-bot-repro

# Bare Bash (requires bash ≥ 4.x and jq)
bash repro-pack/run_repro.sh
```

## Governance workflow (issues-only)
- Use **Proposal (Lazy consensus)** issues for changes in direction.
- Routine timebox: **72 hours**
- Governance/licensing/publication timebox: **7 days**