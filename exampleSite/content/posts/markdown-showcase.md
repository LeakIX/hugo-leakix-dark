---
title: 'Markdown Showcase'
date: 2024-01-16T14:30:00Z
draft: false
description: 'Demonstrating all markdown elements supported by the theme'
categories: ['Documentation']
tags: ['markdown', 'formatting', 'examples']
author: 'Demo Author'
---

This post showcases all the markdown elements and how they appear in the LeakIX
Dark Theme.

## Headings

### Third Level Heading

#### Fourth Level Heading

##### Fifth Level Heading

###### Sixth Level Heading

## Text Formatting

This is a paragraph with **bold text**, _italic text_, **_bold and italic_**,
~~strikethrough~~, and `inline code`.

## Links and Images

[External Link](https://github.com/LeakIX/leakix-dark-theme)
[Internal Link](/posts/welcome/) [Reference Link][1]

[1]: https://gohugo.io

## Code Blocks

### Python

```python
def fibonacci(n):
    """Generate Fibonacci sequence"""
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# Usage
for num in fibonacci(10):
    print(num, end=' ')
```

### JSON

```json
{
  "theme": "LeakIX Dark",
  "version": "1.0.0",
  "features": {
    "darkMode": true,
    "search": true,
    "responsive": true
  }
}
```

### Shell

```bash
# Install the theme
hugo new site mysite
cd mysite
git submodule add https://github.com/LeakIX/leakix-dark-theme themes/leakix-dark
echo 'theme = "leakix-dark"' >> config.toml
hugo server -D
```

## Horizontal Rule

---

## Task Lists

- [x] Create theme
- [x] Add dark mode
- [x] Implement search
- [ ] Add more color schemes
- [ ] Create documentation

## Footnotes

This theme supports footnotes[^1] for additional context[^2].

[^1]:
    Footnotes are great for adding references without cluttering the main text.

[^2]: They appear at the bottom of the page.

## Definition Lists

Hugo : A fast and flexible static site generator

LeakIX Dark Theme : A modern dark theme for Hugo with extensive features

## Abbreviations

The HTML specification is maintained by the W3C.

_[HTML]: HyperText Markup Language _[W3C]: World Wide Web Consortium
