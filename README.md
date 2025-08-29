# design-tokens

> A modern, customizable CSS design token system with built-in dark mode support

## Overview

A complete design system in a single CSS file. Customize 5 core variables to generate your entire design system with automatic color scales, spacing, typography, and more.

## Install

```sh
npm install @shelchin/design-tokens
```

## Usage

```css
@import '@shelchin/design-tokens';
```

**or**

```html
<link rel="stylesheet" href="node_modules/@shelchin/design-tokens/design-tokens.css">
```

## Customization

Override the 5 core variables to customize your design system:

```css
:root {
  --brand-hue: 217;        /* Brand color hue (0-360) */
  --brand-saturation: 91%; /* Brand color saturation */
  --radius-scale: 1;       /* Border radius scale */
  --text-scale: 1;         /* Typography scale */
  --spacing-scale: 1;      /* Spacing scale */
}
```

## Features

- 🎨 **Dynamic color system** - 10 shades generated from your brand color
- 🌗 **Built-in dark mode** - Automatic dark theme support
- 📐 **Consistent spacing** - Mathematical spacing scale
- 🔤 **Typography system** - Hierarchical text sizes
- ✨ **Premium gradients** - 6 crafted gradients
- ♿ **Accessibility ready** - High contrast and reduced motion support
- 📦 **Zero dependencies** - Pure CSS

## Dark Mode

Automatic based on system preference:

```css
@media (prefers-color-scheme: dark) {
  /* Automatic dark mode */
}
```

Manual control:

```html
<html data-theme="dark">
```

## Browser Support

- Chrome (last 3)
- Firefox (last 3)
- Safari (last 3)
- Edge (last 3)

## License

MIT