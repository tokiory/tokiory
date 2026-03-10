---
name: defuddle
description: Guide for extracting main content from web pages using defuddle. Use when users need to convert web pages to clean HTML or Markdown, extract article content, or parse web content programmatically.
---

# Defuddle - Web Content Extraction

## Overview

Defuddle extracts the main content from web pages, removing clutter like comments, sidebars, headers, footers, and other non-essential elements. It outputs clean, consistent HTML or Markdown suitable for reading, archiving, or further processing.

**Key capabilities:**
- Extract article content from URLs or HTML files
- Convert content to Markdown or clean HTML
- Extract metadata (title, author, description, published date, etc.)
- Available as CLI tool, Node.js library, and browser library
- Standardizes HTML elements (headings, code blocks, footnotes, math)

## When to Use This Skill

Use defuddle when users ask to:
- Convert web pages to Markdown or clean HTML
- Extract article content from URLs
- Parse web content programmatically
- Remove clutter from web pages (ads, navigation, sidebars)
- Extract metadata from web pages
- Process HTML files for content extraction

## Installation

```bash
npm install -g defuddle
```

For Node.js usage (requires JSDOM):
```bash
npm install defuddle jsdom
```

## CLI Usage

### Basic Commands

Parse a URL and output Markdown:
```bash
defuddle parse https://example.com/article
```

Parse a local HTML file:
```bash
defuddle parse page.html
```

### Output Options

Output as Markdown:
```bash
defuddle parse page.html --markdown
defuddle parse page.html --md
```

Output as JSON with metadata:
```bash
defuddle parse page.html --json
```

Save output to a file:
```bash
defuddle parse page.html --output result.md
defuddle parse page.html -o result.html
```

Extract a specific property:
```bash
defuddle parse page.html --property title
defuddle parse page.html -p author
```

Enable debug mode (verbose logging):
```bash
defuddle parse page.html --debug
```

### CLI Options Summary

| Option | Alias | Description |
|--------|-------|-------------|
| `--output <file>` | `-o` | Write output to a file |
| `--markdown` | `-m`, `--md` | Convert to Markdown |
| `--json` | `-j` | Output JSON with metadata |
| `--property <name>` | `-p` | Extract specific property |
| `--debug` | | Enable debug mode |

## Node.js Usage

### Basic Parsing

```javascript
import { JSDOM } from 'jsdom';
import { Defuddle } from 'defuddle/node';

// Parse HTML from a string
const html = '<html><body><article>...</article></body></html>';
const result = await Defuddle(html);

// Parse HTML from a URL
const dom = await JSDOM.fromURL('https://example.com/article');
const result = await Defuddle(dom);
```

### With Options

```javascript
const url = 'https://example.com/article';
const result = await Defuddle(dom, url, {
  debug: true,        // Verbose logging
  markdown: true,     // Convert content to markdown
  json: true          // Output as JSON
});

// Access results
console.log(result.content);
console.log(result.title);
console.log(result.author);
```

### Response Properties

| Property | Type | Description |
|----------|------|-------------|
| `content` | string | Cleaned extracted content (HTML or Markdown) |
| `title` | string | Article title |
| `author` | string | Author name |
| `description` | string | Article description/summary |
| `published` | string | Publication date |
| `domain` | string | Domain name |
| `site` | string | Site name |
| `image` | string | Main article image URL |
| `favicon` | string | Site favicon URL |
| `wordCount` | number | Word count of content |
| `metaTags` | object | Meta tags from page |
| `schemaOrgData` | object | Raw schema.org data |
| `parseTime` | number | Parsing time in milliseconds |

## Configuration Options

```javascript
const options = {
  debug: false,                    // Enable debug mode
  markdown: false,                 // Convert to Markdown
  separateMarkdown: false,         // Keep HTML, add contentMarkdown field
  url: 'https://example.com',      // Original page URL
  
  // Content extraction options
  contentSelector: 'article.main', // CSS selector for main content
  useAsync: true,                  // Allow third-party API fallbacks
  
  // Removal options
  removeExactSelectors: true,      // Remove ads, social buttons
  removePartialSelectors: true,    // Remove partial matches
  removeHiddenElements: true,      // Remove display:none elements
  removeLowScoring: true,          // Remove non-content by scoring
  removeSmallImages: true,         // Remove icons/tracking pixels
  removeImages: false,             // Remove all images
  
  // Standardization
  standardize: true                // Standardize HTML elements
};
```

## Browser Usage

```javascript
import Defuddle from 'defuddle';

// Parse current document
const defuddle = new Defuddle(document);
const result = defuddle.parse();

console.log(result.content);
console.log(result.title);
```

## HTML Standardization

Defuddle standardizes HTML for consistent output:

**Headings:**
- Removes first H1/H2 if it matches the title
- Converts H1s to H2s
- Removes anchor links from headings

**Code blocks:**
- Removes line numbers and syntax highlighting
- Preserves language in `data-lang` attribute

**Footnotes:**
- Converts to standard format with backrefs

**Math:**
- Converts MathJax/KaTeX to MathML

## Debugging

Enable debug mode to get detailed extraction info:

```javascript
const result = new Defuddle(document, { debug: true }).parse();

console.log(result.debug.contentSelector);  // Chosen content element
console.log(result.debug.removals);         // List of removed elements
```

Pipeline toggles for troubleshooting:

```javascript
// Skip specific removal steps
const result = await Defuddle(dom, url, {
  removeLowScoring: false,      // Keep low-scoring elements
  removeHiddenElements: false,  // Keep hidden elements
  removeSmallImages: false      // Keep small images
});
```

## Quick Command Reference

**CLI:**
```bash
# Parse URL to Markdown
defuddle parse https://example.com/article --markdown

# Parse file to JSON
defuddle parse page.html --json

# Extract specific property
defuddle parse page.html --property title

# Save to file
defuddle parse page.html -o output.md
```

**Node.js:**
```javascript
import { Defuddle } from 'defuddle/node';
const result = await Defuddle(htmlString, url, { markdown: true });
```

**Browser:**
```javascript
const result = new Defuddle(document).parse();
```

## Resources

- GitHub: https://github.com/kepano/defuddle
- Playground: https://defuddle.md/playground
- NPM: https://www.npmjs.com/package/defuddle
