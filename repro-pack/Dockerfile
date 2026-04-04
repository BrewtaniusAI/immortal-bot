# Immortal Bot — Repro Pack (Docker baseline)
# Provides a fully reproducible, dependency-pinned environment.
#
# Build & run (from the repo root):
#   docker build -t immortal-bot-repro -f repro-pack/Dockerfile .
#   docker run --rm immortal-bot-repro

FROM debian:bookworm-slim

# Install minimal runtime dependencies (pinned via Debian stable)
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    jq \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /repro

# Copy repro-pack contents into the image (build context = repo root)
COPY repro-pack/data/        ./data/
COPY repro-pack/tests/       ./tests/
COPY repro-pack/run_repro.sh ./run_repro.sh
RUN chmod +x ./run_repro.sh ./tests/test_repro.sh

# Include the root qc_validate.sh so tests can verify it is present
COPY qc_validate.sh /repo-root/qc_validate.sh

CMD ["bash", "./run_repro.sh"]
