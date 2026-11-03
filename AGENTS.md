# Agent Instructions

Before starting any task in this repository:

1. Run `make agents/sync`. It writes the shared Plus3 IT instructions for this repository's tardigrade-ci version to `.agents/plus3it/AGENTS.md`.
2. Read `.agents/plus3it/AGENTS.md` and follow it together with this file. If the sync fails, tell the user, and don't guess the conventions.

These rules always apply, even without the shared instructions:

- Don't push, open pull requests, publish releases, or apply infrastructure changes unless the user asks. List those steps for a person in your final report.
- Don't edit files under `.agents/plus3it/`; they are generated and overwritten by the sync.

@.agents/plus3it/AGENTS.md

## Repository-specific

### Purpose

This Terraform module creates one AWS Directory Service directory of type `SimpleAD` (the default), `ADConnector`, or `MicrosoftAD`, set with `type`. The main inputs are `name`, `password`, and `subnet_ids`; the VPC is taken from the first subnet, and `connect_settings` is used when the type is `ADConnector`. The module outputs `id`, `access_url`, `dns_ip_addresses`, and `security_group_id`.
