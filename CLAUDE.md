# LeakIX Dark Theme - AI Assistant Guide

## Project Overview

This repository contains the LeakIX Dark Theme, a modern and responsive Hugo
theme designed for technical blogs, documentation sites, and portfolios. The
theme features a dark design, built-in search functionality, syntax
highlighting, and customizable branding.

## Development Commands

### Essential Commands (Run after each prompt)

```bash
# Format code with Prettier (MUST run after each prompt)
make prettify

# Fix trailing whitespaces (MUST run after each prompt)
make fix-trailing-whitespace
```

### Build and Test Commands

```bash
# Build the example site
make build-example

# Serve the example site locally (http://localhost:1313)
make serve-example

# Run all checks (prettify, whitespace, build)
make test

# Install npm dependencies
make install-deps

# Clean build artifacts
make clean

# Show all available commands
make help
```

## Project Architecture

```
.
├── leakix-dark/              # Main theme directory
│   ├── assets/               # SCSS styles
│   │   └── scss/
│   │       ├── base.scss    # Base styles
│   │       ├── components/  # Component styles
│   │       └── layouts/     # Layout styles
│   ├── layouts/              # Hugo templates
│   │   ├── _default/         # Default layouts
│   │   ├── partials/         # Reusable partials
│   │   └── shortcodes/       # Custom shortcodes
│   ├── static/               # Static assets
│   │   └── images/           # Theme images
│   └── theme.toml            # Theme configuration
├── exampleSite/              # Demo site
│   ├── content/              # Demo content
│   ├── static/               # Demo static files
│   └── config.toml           # Demo configuration
├── .github/                  # GitHub workflows
│   └── workflows/
│       └── ci.yml           # CI/CD pipeline
├── Makefile                  # Build automation
├── package.json              # Node.js dependencies
├── .prettierrc.json         # Prettier configuration
├── go.mod                   # Go module file
├── README.md                # Documentation
└── CLAUDE.md                # This file
```

## Git Workflow

### Important Rules

1. **Never push directly to the main branch**
2. Create feature branches for all changes
3. Submit changes via pull requests
4. Ensure CI checks pass before merging

### Commit Process

```bash
# ALWAYS create a new feature branch first
git checkout -b feature/your-feature-name

# Stage changes
git add -A

# Create commit with descriptive message
git commit -m "feat: add new feature" -m "Detailed description of changes"

# Push to feature branch
git push -u origin feature/your-feature-name
```

**Important**:

- ALWAYS create a new branch for changes
- NEVER commit directly to main branch
- NEVER push to main branch

### Creating Pull Requests

```bash
# Create and switch to feature branch
git checkout -b feature/your-feature

# Make changes, then push
git push -u origin feature/your-feature

# Create PR via GitHub CLI
gh pr create --title "Feature: Your feature" --body "
## Summary
- Add feature X
- Fix issue Y
- Improve Z

## Test Plan
- [ ] Run make test
- [ ] Verify example site builds
- [ ] Check theme functionality"
```

## Code Quality Standards

### Before Every Commit

1. **Format code**: `make prettify`
2. **Fix whitespace**: `make fix-trailing-whitespace`
3. **Run tests**: `make test`
4. **Build example**: `make build-example`

### Code Style Guidelines

- Use 2 spaces for indentation in HTML/SCSS/JS
- Use 80 character line width for markdown
- Follow Go template best practices
- Maintain consistent SCSS structure
- Keep partials modular and reusable

## Theme Customization

### Configuration Parameters

The theme supports extensive customization through `config.toml`:

```toml
[params]
  # Branding
  siteName = "Your Site Name"
  logo = "/images/logo.png"

  # Colors (customize for your brand)
  primaryColor = "#00ff9f"
  secondaryColor = "#1a1a1a"
  accentColor = "#ff6b6b"

  # Features
  enableSearch = true
  enableShareButtons = true
  enableRelatedPosts = true
```

### Adding New Features

1. Create feature in appropriate directory
2. Update theme configuration
3. Document in README.md
4. Add example in exampleSite
5. Run formatting and tests

## Testing

### Local Testing

```bash
# Test theme with example site
cd exampleSite
hugo server --themesDir ../..
```

### CI/CD Testing

The CI pipeline tests on:

- macOS: latest, 13, 14, 15
- Ubuntu: 22.04, 24.04, 24.04-arm

All commits trigger automated testing.

## Common Tasks

### Adding a New Partial

1. Create file in `leakix-dark/layouts/partials/`
2. Use in templates with `{{ partial "name.html" . }}`
3. Add styles in appropriate SCSS file
4. Update example site to demonstrate

### Modifying Styles

1. Edit SCSS files in `leakix-dark/assets/scss/`
2. Follow existing structure and naming
3. Test responsive behavior
4. Run prettify after changes

### Updating Documentation

1. Update README.md for user-facing changes
2. Update this file for development changes
3. Add examples in exampleSite
4. Keep theme.toml metadata current

## Troubleshooting

### Build Failures

```bash
# Clean and rebuild
make clean
make install-deps
make build-example
```

### Formatting Issues

```bash
# Auto-fix all formatting
make prettify
make fix-trailing-whitespace
```

### Hugo Errors

- Ensure Hugo Extended version >= 0.120.0
- Check for missing partials
- Verify config.toml syntax
- Review template syntax errors

## Important Notes

- **Always run `make prettify` after making changes**
- **Always run `make fix-trailing-whitespace` before commits**
- **Never commit without running `make test`**
- **Document all new features in README.md**
- **Keep exampleSite updated with new features**
- **Test on multiple screen sizes for responsive design**

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Themes Guide](https://gohugo.io/hugo-modules/theme-components/)
- [SCSS Documentation](https://sass-lang.com/documentation)
- [Repository](https://github.com/LeakIX/leakix-dark-theme)
