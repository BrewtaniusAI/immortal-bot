# Human Global Science Collective (HGSC) — Governance Charter

**Version**: 1.0-draft  
**Status**: Draft for community review  
**Zenodo alignment**: [DOI 10.5281/zenodo.17053441](https://doi.org/10.5281/zenodo.17053441)

---

## Preamble

The Human Global Science Collective (HGSC) is a voluntary, decentralised body of researchers, engineers, and practitioners united by a shared commitment to open, patent-free, and non-commercial scientific progress. This charter establishes the governing principles, decision-making processes, membership obligations, and field-alignment standards that bind all HGSC participants.

---

## 1. Foundational Principles

### 1.1 Patent-Free Collaboration
All knowledge, methods, tools, and derivative works contributed to or produced under HGSC auspices are dedicated to the public domain of open science and shall not be claimed, encumbered, or restricted by patents, utility models, or similar exclusive intellectual-property instruments. Every participant affirms, through the OSNA pledge (§ 4), that they will not assert such rights against any other participant, downstream user, or the broader public.

### 1.2 Open Science Values
HGSC upholds the following open science values:

| Value | Commitment |
|---|---|
| **Transparency** | Methods, data, and decision rationales are documented and publicly accessible. |
| **Reproducibility** | Contributions must include sufficient detail for independent replication. |
| **Accessibility** | Materials are published under open licences with no pay-walls or proprietary barriers. |
| **Inclusivity** | Participation is open to all people regardless of institutional affiliation, geography, or background. |
| **Integrity** | Findings are reported honestly; conflicts of interest are disclosed. |

### 1.3 Non-Commercial Commitment
HGSC activities, outputs, and collaborative works are restricted to personal, research, and non-commercial educational purposes, consistent with the **PATENT-FREE SCIENCE IN THE JANUS ERA License (v2.0)**. Commercial exploitation of HGSC-produced works is prohibited without the explicit written consent of the HGSC Stewardship Council and, where applicable, individual contributors.

---

## 2. Membership

### 2.1 Eligibility
Any individual who accepts this charter and signs the OSNA pledge (§ 4) may become an HGSC participant.

### 2.2 Roles

| Role | Description |
|---|---|
| **Participant** | Any contributor who has signed the OSNA pledge. |
| **Maintainer** | A participant with merge/publish rights in a recognised HGSC project. |
| **Steward** | A maintainer elected to the Stewardship Council for a one-year renewable term. |

### 2.3 Removal
A participant may be removed for sustained violations of this charter by a two-thirds supermajority vote of the Stewardship Council following a documented notice-and-response process.

---

## 3. Consensus Process for Project Direction

HGSC uses a **lazy consensus** model for all decisions, mirroring the governance workflow of the Immortal Bot repository.

### 3.1 Proposal Submission
Any participant may open a **Proposal** issue in the relevant project repository. The proposal must state:
- The change or direction being proposed.
- The rationale and expected outcomes.
- Any resources, timelines, or dependencies involved.

### 3.2 Timeboxes

| Decision type | Timebox |
|---|---|
| Routine (code, documentation, tooling) | **72 hours** |
| Governance, licensing, or publication | **7 days** |
| Charter amendments | **14 days** |

### 3.3 Lazy Consensus Rules
- Silence within the timebox is treated as assent.
- Any participant may block consensus by posting a reasoned objection before the timebox expires.
- If a block is raised, the proposer and objector must attempt to reach a modified proposal within a secondary timebox equal to the original.
- If consensus still cannot be reached, the Stewardship Council votes; a simple majority carries the decision, except for charter amendments which require a two-thirds supermajority.

### 3.4 Emergency Actions
In exceptional circumstances (e.g., security vulnerabilities, legal obligations), a Maintainer may act without completing the timebox, subject to a mandatory retrospective review posted within 48 hours.

---

## 4. OSNA Pledge Mechanism

The **Open Science Non-Assert (OSNA) pledge** is a mandatory commitment for all HGSC participants. By signing the pledge, a participant affirms:

> *"I will not assert any patent, utility model, or similar exclusive intellectual-property right against this project, its participants, or any downstream user, for any contribution, derivative work, or implementation that is based on, derived from, or inspired by work produced under HGSC auspices."*

### 4.1 How to Sign
Include the following statement in every pull-request description or contribution submission:

> I agree to the OSNA-style non-assert pledge for my contributions to this project, as described in `HGSC_CHARTER.md § 4`.

### 4.2 Organisational Signatories
Organisations wishing to contribute on behalf of employees must open a dedicated issue proposing organisation-approved pledge wording for Stewardship Council ratification before their employees begin contributing.

### 4.3 Pledge Records
Pledge records (GitHub username / PR / date) are maintained in [`governance_payload.json`](./governance_payload.json) and versioned in the repository for auditability.

---

## 5. Field Alignment with the Zenodo Framework

HGSC outputs are anchored to the **Zenodo** open-access repository and the dataset at [DOI 10.5281/zenodo.17053441](https://doi.org/10.5281/zenodo.17053441), which documents the alignment with *'A Framework for Patent-Free Science'*.

### 5.1 Deposit Requirements
All significant HGSC outputs (datasets, software releases, preprints, reproducibility packs) must be deposited on Zenodo under an open licence before or concurrent with any other public release.

### 5.2 Citation Metadata
Each HGSC project must maintain a `CITATION.cff` file that includes:
- The project DOI on Zenodo.
- Reference to [DOI 10.5281/zenodo.17053441](https://doi.org/10.5281/zenodo.17053441) as a related identifier.
- SPDX licence expression consistent with the PATENT-FREE SCIENCE IN THE JANUS ERA License (v2.0).

### 5.3 Reproducibility Standard
Deposits must include sufficient information for an independent researcher to reproduce the core results, consistent with the reproducibility requirements in `ONBOARDING.md`.

---

## 6. Stewardship Council

### 6.1 Composition
The Stewardship Council comprises up to seven Stewards elected by participants. The initial Council is appointed by the founding Maintainers for a six-month bootstrapping term.

### 6.2 Responsibilities
- Ratify charter amendments.
- Mediate unresolved consensus blocks.
- Approve organisational OSNA pledge wording.
- Oversee Zenodo deposit compliance.
- Maintain the governance audit trail in `governance_payload.json`.

### 6.3 Meetings
The Council meets asynchronously (issue-based) by default. Synchronous meetings may be held at the Council's discretion, with minutes published in the repository within 72 hours.

---

## 7. Amendments

Proposed amendments to this charter must:
1. Be submitted as a **Proposal** issue labelled `charter-amendment`.
2. Remain open for a **14-day** community review period.
3. Receive a two-thirds supermajority vote from the Stewardship Council to pass.
4. Be committed to the repository with a version bump (e.g., `1.0 → 1.1`) and a dated changelog entry below.

---

## 8. Relationship to Existing Governance Documents

This charter supplements and does not replace the following documents:

| Document | Purpose |
|---|---|
| `GOVERNANCE.md` | Lazy consensus timeboxes and OSNA pledge summary |
| `CONTRIBUTING.md` | Contribution workflow and non-commercial terms |
| `ONBOARDING.md` | Onboarding steps, QC validation, and OSNA acknowledgement |
| `LICENSE` | Full text of the PATENT-FREE SCIENCE IN THE JANUS ERA License (v2.0) |
| `CITATION.cff` | Citation metadata and Zenodo DOI |

---

## Changelog

| Version | Date | Notes |
|---|---|---|
| 1.0-draft | 2026-04-04 | Initial draft for community review |
