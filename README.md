# LeakIX Dark Theme

A modern, responsive dark theme for Hugo with built-in search functionality,
syntax highlighting, and fully customizable branding. Originally created for the
LeakIX security blog, now available as a standalone theme for any Hugo project.

## Live Demo

- **Demo Site**:
  [https://leakix.github.io/hugo-leakix-dark/](https://leakix.github.io/hugo-leakix-dark/)
- **Live Example**: [blog.leakix.net](https://blog.leakix.net) - The LeakIX
  security blog uses this theme

## Features

- **Dark Design**: Eye-friendly dark color scheme perfect for technical content
- **Fully Responsive**: Optimized for all screen sizes from mobile to desktop
- **Built-in Search**: Client-side search functionality with no external
  dependencies
- **Syntax Highlighting**: Beautiful code highlighting with multiple language
  support
- **SEO Optimized**: Schema.org structured data, Open Graph tags, and Twitter
  Cards
- **Social Sharing**: Built-in social media share buttons
- **Related Posts**: Automatic related content suggestions
- **Customizable Branding**: Easy color and typography customization via config
- **Performance Focused**: Optimized assets, lazy loading, and minimal
  dependencies
- **Hugo Module Support**: Can be used as a Hugo module or git submodule

## Screenshots

![Theme Preview](Screenshot.png)

## Requirements

- Hugo Extended version >= 0.153.0
- Node.js >= 20 (for development tools)

## Installation

### Method 1: Hugo Module (Recommended)

1. Initialize Hugo modules in your project:

```bash
hugo mod init github.com/yourusername/yourproject
```

2. Add the theme to your `config.toml`:

```toml
[module]
  [[module.imports]]
    path = "github.com/LeakIX/leakix-dark-theme"
```

3. Update modules:

```bash
hugo mod get -u
```

### Method 2: Git Submodule

```bash
git submodule add https://github.com/LeakIX/leakix-dark-theme.git themes/leakix-dark
```

Add to your `config.toml`:

```toml
theme = "leakix-dark"
```

### Method 3: Download Release

Download the latest release from
[GitHub Releases](https://github.com/LeakIX/leakix-dark-theme/releases):

1. Go to the
   [Releases page](https://github.com/LeakIX/leakix-dark-theme/releases)
2. Download the latest `.tar.gz` or `.zip` file
3. Extract to `themes/leakix-dark/` in your Hugo site
4. Add `theme = "leakix-dark"` to your `config.toml`

Each release includes:

- Complete theme files
- Installation guide
- Documentation
- Example configurations

Releases are automatically created on every update to the main branch.

## Configuration

### Basic Configuration

```toml
baseURL = 'https://example.com/'
languageCode = 'en-us'
title = 'Your Site Title'
theme = 'leakix-dark'
paginate = 6

[params]
  # Site branding
  siteName = "Your Site"
  siteDescription = "Your site description"
  logo = "/images/logo.png"
  favicon = "/favicon.ico"

  # Social links
  twitter = "https://twitter.com/yourhandle"
  github = "https://github.com/yourhandle"
  linkedin = "https://linkedin.com/in/yourhandle"

  # Features
  enableSearch = true
  enableShareButtons = true
  enableRelatedPosts = true
  enableSyntaxHighlighting = true

  # SEO
  author = "Your Name"
  keywords = ["blog", "technology", "programming"]

  # Footer
  copyright = "© 2024 Your Name. All rights reserved."
```

### Color Customization

Customize the theme colors to match your brand:

```toml
[params]
  # Primary colors
  primaryColor = "#fab741"        # Main accent color
  secondaryColor = "#ff8c00"       # Secondary accent
  accentColor = "#e09b2a"          # Additional accent

  # Background colors
  backgroundColor = "#181f27"      # Main background
  backgroundDarkColor = "#090e15"  # Darker sections
  backgroundLightColor = "#353a40" # Lighter sections
  cardBackgroundColor = "#1f2731"  # Card backgrounds
  footerBackgroundColor = "#010203" # Footer background

  # Text colors
  textColor = "#ffffff"            # Main text
  textLightColor = "#707070"       # Muted text
  textDarkColor = "#090e15"        # Dark text (on light backgrounds)

  # Other colors
  borderColor = "#2a3138"          # Borders
  successColor = "#28a745"         # Success messages
  dangerColor = "#dc3545"          # Error messages
  warningColor = "#f9b640"         # Warning messages
```

### Typography Customization

```toml
[params]
  fontFamily = "'JetBrains Mono', 'Courier New', monospace"
  fontSize = "16px"
  lineHeight = "1.6"
```

### Menu Configuration

```toml
[menu]
  [[menu.main]]
    name = "Home"
    url = "/"
    weight = 1

  [[menu.main]]
    name = "Posts"
    url = "/posts/"
    weight = 2

  [[menu.main]]
    name = "Categories"
    url = "/categories/"
    weight = 3

  [[menu.main]]
    name = "Tags"
    url = "/tags/"
    weight = 4

  [[menu.main]]
    name = "Search"
    url = "/search/"
    weight = 5
```

## Content Organization

### Post Front Matter

```yaml
---
title: 'Your Post Title'
date: 2024-01-20T10:00:00Z
draft: false
description: 'A brief description of your post'
categories: ['Technology']
tags: ['hugo', 'web', 'tutorial']
author: 'Your Name'
image: '/images/featured-image.jpg'
---
```

### Shortcodes

#### Reading Files

Import code from external files:

```markdown
{{< readfile file="/static/code/example.go" code="true" lang="go" >}}
```

#### Social Media Embeds

```markdown
{{< x "1234567890" >}}
```

## Development

### Setup Development Environment

```bash
# Clone the repository
git clone https://github.com/LeakIX/leakix-dark-theme.git
cd leakix-dark-theme

# Install dependencies
npm install

# Run example site locally
make serve-example
```

### Available Commands

```bash
make help              # Show all available commands
make prettify          # Format code with Prettier
make fix-trailing-whitespace  # Fix trailing whitespace
make test              # Run all tests
make build-example     # Build example site
make serve-example     # Serve example site locally
```

### Testing Locally with Act

Run GitHub Actions workflows locally:

```bash
# Install act via GitHub CLI
gh extension install https://github.com/nektos/gh-act

# Run CI workflow
gh act push

# Run specific job
gh act -j test
```

## File Structure

```
leakix-dark/
├── assets/
│   └── scss/           # SCSS styles
├── layouts/
│   ├── _default/       # Default layouts
│   ├── partials/       # Reusable partials
│   └── shortcodes/     # Custom shortcodes
├── static/
│   └── images/         # Static images
└── theme.toml          # Theme metadata
```

## Browser Support

- Chrome/Edge (latest 2 versions)
- Firefox (latest 2 versions)
- Safari (latest 2 versions)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Releases

This repository uses automated releases:

- **Automatic**: New releases are created on every push to main branch
- **Versioning**: `vYYYY.MM.DD-{commit}` format (e.g., `v2024.01.15-a1b2c3d`)
- **Assets**: Each release includes `.tar.gz` and `.zip` archives
- **Changelog**: Generated from commit messages since last release
- **Contents**: Clean theme files, documentation, and installation guide

Download the latest release:
[GitHub Releases](https://github.com/LeakIX/leakix-dark-theme/releases/latest)

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Run tests (`make test`)
5. Format code (`make prettify && make fix-trailing-whitespace`)
6. Commit your changes
7. Push to your fork
8. Create a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## Support

- **Documentation**: See the
  [Wiki](https://github.com/LeakIX/leakix-dark-theme/wiki)
- **Issues**:
  [GitHub Issues](https://github.com/LeakIX/leakix-dark-theme/issues)
- **Discussions**:
  [GitHub Discussions](https://github.com/LeakIX/leakix-dark-theme/discussions)

## License

This theme is released under the [MIT License](LICENSE).

## Credits

- Originally created by the [LeakIX Team](https://leakix.net)
- Based on Bootstrap 5 and modern web standards
- Inspired by terminal and code editor themes

## Users

Sites using LeakIX Dark Theme:

- [blog.leakix.net](https://blog.leakix.net) - LeakIX Security Blog
- _Add your site here via PR!_

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a list of changes in each release.

## Roadmap

- [ ] Multiple color schemes
- [ ] RTL language support
- [ ] Advanced search filters
- [ ] Comment system integration
- [ ] Newsletter integration
- [ ] Analytics dashboard

---

Made by the LeakIX Team
