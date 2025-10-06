# LeakIX Dark Theme - Shortcodes Usage Guide

## Available Shortcodes

### 1. `tip` - Info/Warning Boxes

Display informational or warning notices with markdown support.

**Syntax:**

```markdown
{{< tip >}} Your content here with **markdown** support {{< /tip >}}

{{< tip "warning" >}} Warning message with [links](https://example.com)
{{< /tip >}}
```

**Parameters:**

- First parameter (optional): Style type
  - Omit or "info" = Info box (teal)
  - "warning" = Warning box (yellow)

**Examples:**

```markdown
{{< tip >}} Notice how phrase with spaces are enclosed between double quotes
(`"`) to make it a single term. {{< /tip >}}

{{< tip "warning" >}} Alerting is available for pro users only. See our various
[plans](https://leakix.net/plans) to get access. {{< /tip >}}
```

---

### 2. `button` - Styled Button Links

Create prominent call-to-action buttons.

**Syntax:**

```markdown
{{< button "path/to/page" "Button Text" >}}
```

**Parameters:**

1. First parameter (required): URL path (relative or absolute)
2. Second parameter (required): Button text/label

**Examples:**

```markdown
{{< button "docs/" "Read the Docs" >}}

{{< button "/docs/api/authentication" "Get started" >}}

{{< button "https://external.com" "Visit External Site" >}}
```

---

### 3. `block` and `column` - Responsive Grid Layouts

Create multi-column layouts that stack on mobile.

**Syntax:**

```markdown
{{< block "grid-type" >}} {{< column >}} First column content with **markdown**
{{< /column >}}

{{< column >}} Second column content {{< /column >}} {{< /block >}}
```

**Parameters:**

- `block` first parameter (optional): Grid type
  - "grid-2" = 2 equal columns (default)
  - "grid-3" = 3 equal columns
  - "grid-4" = 4 equal columns

**Responsive Behavior:**

- Mobile (< 768px): All columns stack vertically
- Tablet (≥ 768px): 2 columns for grid-2, grid-3, grid-4
- Desktop (≥ 992px): 3 columns for grid-3, 4 columns for grid-4

**Examples:**

```markdown
<!-- Two-column layout -->

{{< block "grid-2" >}} {{< column >}}

# Welcome

This is the first column with a heading, paragraphs, and even buttons!

{{< button "docs/" "Read More" >}} {{< /column >}}

{{< column >}} ![Image](/images/example.png) {{< /column >}} {{< /block >}}
```

```markdown
<!-- Three-column layout -->

{{< block "grid-3" >}} {{< column >}}

## Feature 1

Description here {{< /column >}}

{{< column >}}

## Feature 2

Description here {{< /column >}}

{{< column >}}

## Feature 3

Description here {{< /column >}} {{< /block >}}
```

---

## Nesting Shortcodes

You can nest shortcodes within each other:

```markdown
{{< block "grid-2" >}} {{< column >}} {{< tip >}} This is a tip inside a column!
{{< /tip >}}

{{< button "/docs" "Learn More" >}} {{< /column >}}

{{< column >}} More content here {{< /column >}} {{< /block >}}
```

---

## Markdown Support

All shortcodes support full markdown content:

- **Bold**, _italic_, `code`
- [Links](https://example.com)
- Lists, blockquotes, code blocks
- Images
- Headings

**Example:**

```markdown
{{< tip >}}

## Important Note

Here's a tip with:

- A list item
- Another item with `code`
- A [link](https://example.com)

And a **bold statement**! {{< /tip >}}
```

---

## Styling

All shortcodes use the LeakIX Dark theme styling:

- **Colors**: Teal primary, orange secondary, yellow warnings
- **Dark mode**: Fully compatible
- **Responsive**: Mobile-first design
- **Animations**: Smooth hover effects on buttons

---

## Common Patterns

### Hero Section with CTA

```markdown
{{< block "grid-2" >}} {{< column >}}

# Get Started with LeakIX

Discover vulnerabilities and misconfigurations across the internet.

{{< button "docs/" "Read the Docs" >}} {{< /column >}}

{{< column >}} ![Hero Image](/images/hero.png) {{< /column >}} {{< /block >}}
```

### Feature Grid

```markdown
{{< block "grid-3" >}} {{< column >}}

## Fast

Lightning-fast search across millions of records {{< /column >}}

{{< column >}}

## Accurate

Precise results with advanced filtering {{< /column >}}

{{< column >}}

## Reliable

99.9% uptime with real-time updates {{< /column >}} {{< /block >}}
```

### Warning with Action

```markdown
{{< tip "warning" >}}

**Authentication Required**: This endpoint requires a valid API key.

{{< button "/docs/api/authentication" "Get API Key" >}} {{< /tip >}}
```

---

## Troubleshooting

**Markdown not rendering?**

- Make sure there's a blank line before and after markdown content
- Check that the shortcode uses `.Inner | .Page.RenderString`

**Columns not appearing side-by-side?**

- Verify you're using the `block` shortcode wrapper
- Check screen width (columns stack on mobile < 768px)

**Button not working?**

- Ensure both parameters are provided
- Use quotes around parameters with spaces: `{{< button "docs/" "Read Docs" >}}`
