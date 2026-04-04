# Defensive Publication Guide

This document explains the defensive publication process for Immortal Bot. Every major release, disclosure, or innovation is published to [Zenodo](https://zenodo.org) to generate a timestamped, citable DOI — establishing public prior art per **'A Framework for Patent-Free Science.'**

---

## What is defensive publication?

A **defensive publication** is a public disclosure of an idea, design, or method specifically intended to prevent anyone else from patenting it. By creating a timestamped, publicly accessible record, the work enters the public domain and can no longer be patented by any party.

This project uses Zenodo — a CERN-operated open repository — to:
- Assign a permanent **DOI** (Digital Object Identifier) to each release
- Create an immutable, **timestamped** record
- Make the artifact **openly citable** in scientific literature

---

## One-click publishing: GitHub Actions workflow

The workflow at [`.github/workflows/zenodo-publish.yml`](.github/workflows/zenodo-publish.yml) runs automatically every time a GitHub **Release** is published.

### What the workflow does

1. Validates `.zenodo.json` metadata
2. Creates a new Zenodo deposition via the Zenodo API
3. Packages the repository at the release tag as a ZIP archive
4. Uploads the archive to Zenodo
5. Publishes the deposition, obtaining a permanent DOI
6. Writes the DOI to the workflow run summary

### Required secret

Set the following secret in **Settings → Secrets → Actions** on GitHub:

| Secret name | Description |
|-------------|-------------|
| `ZENODO_TOKEN` | A personal access token from your Zenodo account (see below) |

#### How to get a Zenodo token

1. Log in at [zenodo.org](https://zenodo.org) (or [sandbox.zenodo.org](https://sandbox.zenodo.org) for testing)
2. Go to **Account → Applications → Personal access tokens**
3. Create a new token with scopes: `deposit:write`, `deposit:actions`
4. Copy the token and add it as the `ZENODO_TOKEN` secret in this repository

---

## Zenodo metadata: `.zenodo.json`

The file [`.zenodo.json`](.zenodo.json) at the repository root configures the metadata for every Zenodo deposition. Edit this file to update:

- Title, description, creators
- Keywords
- Related identifiers (linked DOIs or URLs)
- Notes (e.g., defensive publication statement)

Zenodo's GitHub integration also reads this file automatically when the [Zenodo–GitHub sync](https://zenodo.org/account/settings/github/) is enabled on your account.

---

## Manual publishing (fallback)

If the automated workflow is unavailable, follow these steps:

1. **Create a GitHub Release** for the relevant tag.
2. Go to [zenodo.org/account/settings/github](https://zenodo.org/account/settings/github) and enable the repository.
3. Zenodo will automatically create a deposition and assign a DOI using `.zenodo.json`.
4. Record the DOI in `CITATION.cff` and the release notes.

---

## Citation metadata: `CITATION.cff`

The file [`CITATION.cff`](CITATION.cff) provides machine-readable citation metadata. Update it with the assigned DOI after each publication:

```yaml
doi: "10.5281/zenodo.XXXXXXX"
version: "vX.Y.Z"
date-released: "YYYY-MM-DD"
```

---

## Governance alignment

Defensive publication releases follow the **7-day governance timebox** (see [`GOVERNANCE.md`](GOVERNANCE.md)) and require QC validation to pass before a release is cut. Each published artifact:

- Establishes public prior art
- Is covered by the **PATENT-FREE SCIENCE IN THE JANUS ERA License (v2.0)**
- Cannot be patented by any contributor or third party per the license terms and the OSNA-style non-assert pledge
