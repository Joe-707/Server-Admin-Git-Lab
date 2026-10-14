# Linux Lab Project

**Author:** Joe-707
**Course:** Server Administration (CNS 3A)
**Email:** joseph.mbagi@strathmore.edu

## Overview
This repository documents the practical work completed during the
Server Administration lab sessions, covering:

- User and group management
- File permissions and ownership (including SGID and sticky bit)
- LAMP stack installation and configuration
- Git and GitHub workflow automation

## Contents

| File | Purpose |
|------|---------|
| `system-check.sh` | Verifies department directories, groups, and LAMP services |
| `.github/workflows/hello.yml` | GitHub Actions workflow that runs the script on every push |

## How to Run

```bash
chmod +x system-check.sh
./system-check.sh
