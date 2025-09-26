# CI/CD Workflows

## Overview

This directory contains GitHub Actions workflows for continuous integration and deployment of the LeakIX Dark Theme.

## Workflows

### CI Workflow (`ci.yml`)

The main CI workflow that:
- Tests on multiple OS versions (macOS and Ubuntu)
- Checks code formatting and trailing whitespace
- Builds the example site
- Deploys PR previews to GitHub Pages
- Deploys main branch to production

### Test Matrix

The CI tests on the following platforms:
- macOS: latest, 13, 14, 15
- Ubuntu: 22.04, 24.04, 24.04-arm

## Running CI Locally with Act

You can run the CI workflows locally using [act](https://github.com/nektos/act), which can be installed via GitHub CLI.

### Installation

```bash
# Install act using GitHub CLI
gh extension install https://github.com/nektos/gh-act

# Verify installation
gh act --version
```

### Running Workflows Locally

```bash
# List available workflows and jobs
gh act -l

# Run the entire CI workflow
gh act push

# Run specific job
gh act -j test

# Run with specific OS (act uses Docker containers to simulate runners)
gh act -j test -P ubuntu-latest=ghcr.io/catthehacker/ubuntu:full-latest
gh act -j test -P macos-latest=ghcr.io/catthehacker/ubuntu:full-latest

# Run with verbose output
gh act -v push

# Run with specific event (e.g., pull request)
gh act pull_request

# Dry run (show what would be executed)
gh act -n push

# Run with custom event payload
gh act push -e .github/test-event.json
```

### Common Use Cases

#### Test PR Changes Locally
```bash
# Simulate a pull request event
gh act pull_request --pull=false
```

#### Test Main Branch Deployment
```bash
# Simulate a push to main
gh act push --branch main
```

#### Debug Workflow Issues
```bash
# Run with debug output and keep containers for inspection
gh act -v --container-architecture linux/amd64 --rm=false
```

### Act Configuration

Create `.actrc` file in the project root for default configurations:

```bash
# .actrc
-P ubuntu-latest=ghcr.io/catthehacker/ubuntu:full-latest
-P ubuntu-22.04=ghcr.io/catthehacker/ubuntu:full-22.04
-P ubuntu-24.04=ghcr.io/catthehacker/ubuntu:full-24.04
-P macos-latest=ghcr.io/catthehacker/ubuntu:full-latest
--container-architecture linux/amd64
```

### Limitations

When running with act:
- macOS runners are simulated using Linux containers
- Some GitHub-specific features may not be available
- Secrets need to be provided via `.secrets` file or environment variables
- ARM architecture testing may require specific Docker setup

### Secrets for Local Testing

Create a `.secrets` file (git-ignored) for local testing:

```bash
# .secrets
GITHUB_TOKEN=your_github_token_here
```

Never commit the `.secrets` file!

## Makefile Integration

The CI workflow uses Makefile targets for consistency:

```bash
# Run the same checks as CI
make test

# Individual CI steps
make check-trailing-whitespace
make check-prettify
make build-example
```

## Troubleshooting

### Act Installation Issues

If `gh extension install` fails, install act directly:

```bash
# macOS
brew install act

# Linux
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Via Go
go install github.com/nektos/act@latest
```

### Docker Issues

Ensure Docker is running:
```bash
docker version
docker ps
```

### Resource Constraints

For large workflows, increase Docker resources:
- Memory: At least 4GB
- CPUs: At least 2 cores
- Disk: At least 10GB free space

## Dependabot Configuration

Dependabot is configured to:
- Check for npm updates weekly
- Check for GitHub Actions updates weekly
- Check for Go module updates weekly
- Create PRs with appropriate labels
- Use semantic commit messages

See `.github/dependabot.yml` for full configuration.