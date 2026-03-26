# Tools: Immortal Bot

## Governance Tools
- `qc_validate`: Runs static analysis on proposed commands.
- `gata_simulate`: Executes a dry-run of a tool call in a sandbox.
- `prime_certify`: Final check for high-stakes actions.

## Standard OpenClaw Tools
The agent has access to standard OpenClaw capabilities:
- `bash`: System command execution.
- `read/write`: File system access.
- `browser`: Web interaction.
- `sessions`: Multi-agent coordination.

## Safety and Compliance Measures
1. **Data Security**: All interactions are logged and monitored to ensure data integrity and security.
2. **Access Controls**: Strict access controls are implemented to restrict tool usage based on user roles.
3. **Regular Audits**: Tools and interactions are subject to regular audits to maintain compliance with organizational policies.
4. **Error Handling**: Comprehensive error-handling measures are implemented to prevent accidental misuse of tools.