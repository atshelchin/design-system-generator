# Design Tokens System

> A comprehensive, SwiftUI-compatible CSS design system with built-in dark mode, accessibility features, and bilingual support

## Overview

A production-ready design token system that provides a complete visual foundation for web and SwiftUI applications. This system emphasizes consistency, accessibility, and cross-platform compatibility with a "60% good enough" visual philosophy - focusing on solving problems rather than perfect aesthetics.

## Features

### Core Systems
- 🎨 **Dynamic Color System** - 10-level color scales for brand and neutral colors with semantic mappings
- 🌗 **Dark Mode Support** - Complete dark theme with optimized text brightness control
- 📐 **Mathematical Spacing** - 20+ spacing tokens with configurable scale factor
- 🔤 **Typography System** - 10 font sizes, 9 font weights, with system font stack
- 🎭 **Shadow System** - 8 shadow levels from xs to 2xl
- 🔘 **Radius System** - 9 border radius values with scale factor support

### Hierarchy & Organization
- 📊 **6-Level Visual Hierarchy** - For headings, descriptions, values, and panels
- 🏗️ **Panel System** - 6 panel levels with special variants (elevated, sunken, accent, muted)
- 🎯 **Semantic Colors** - Purpose-driven color tokens for UI states and actions
- 🔲 **Border System** - 5-level border hierarchy for visual separation

### Accessibility
- ♿ **High Contrast Modes** - Normal, high, and ultra-high contrast support
- 🔍 **Font Scaling** - Global font size adjustment (0.875x to 1.5x)
- 📏 **Adjustable Line Height** - Four presets: tight, normal, relaxed, loose
- 🔤 **Letter Spacing** - Four width options for improved readability
- 🎬 **Motion Preferences** - Respects prefers-reduced-motion

## Installation

### Direct Download
```html
<link rel="stylesheet" href="design-tokens.css">
```

### NPM (Coming Soon)
```sh
npm install @shelchin/design-tokens
```

## Usage

### Basic Setup
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="design-tokens.css">
</head>
<body>
    <!-- Your content -->
</body>
</html>
```

### Customization
Override the core configuration variables to customize your design system:

```css
:root {
  /* Core Configuration */
  --brand-hue: 217;        /* Primary brand color hue (0-360) */
  --brand-saturation: 91%; /* Brand color saturation (0-100%) */
  --radius-scale: 1;       /* Border radius multiplier */
  --spacing-scale: 1;      /* Spacing multiplier */
  
  /* Accessibility */
  --font-scale: 1;         /* Global font size multiplier */
  --contrast-mode: normal; /* normal | high | ultra */
  --letter-spacing: normal;/* normal | wide | wider | widest */
  --line-height: 1.6;      /* Base line height */
}
```

### Dark Mode

#### Automatic (System Preference)
The system automatically responds to the user's OS dark mode preference.

#### Manual Control
```html
<!-- Force dark mode -->
<html data-theme="dark">

<!-- Toggle via JavaScript -->
<script>
document.documentElement.setAttribute('data-theme', 'dark');
</script>
```

### Accessibility Features

#### High Contrast Mode
```html
<html data-contrast="high">  <!-- High contrast -->
<html data-contrast="ultra"> <!-- Ultra high contrast -->
```

#### Font Size Adjustment
```html
<html data-font-size="large">    <!-- 1.125x -->
<html data-font-size="x-large">  <!-- 1.25x -->
<html data-font-size="xx-large"> <!-- 1.5x -->
```

#### Line Height Adjustment
```html
<html data-line-height="relaxed"> <!-- 1.8 -->
<html data-line-height="loose">   <!-- 2.2 -->
```

## SwiftUI Compatibility

This design system is 100% compatible with SwiftUI. The token values can be easily mapped to SwiftUI's design system:

```swift
// Example SwiftUI color mapping
extension Color {
    static let brand600 = Color(hue: 217/360, saturation: 0.91, brightness: 0.4)
    static let primaryColor = brand600
    static let backgroundColor = Color.white
    static let foregroundColor = Color(white: 0.1)
}

// Example spacing mapping
extension CGFloat {
    static let space4 = 16.0  // --space-4
    static let space8 = 32.0  // --space-8
}
```

## Interactive Showcase

View the interactive showcase to explore all design tokens and test different configurations:

```bash
# Open showcase.html in your browser
open showcase.html
```

The showcase includes:
- Live theme switching
- Color palette viewer
- Typography samples
- Spacing demonstrations
- Component examples
- Accessibility controls
- Font upload system

## Design Philosophy

This system follows a "60% good enough" visual philosophy:
- **Practical over Perfect** - Focus on solving problems, not pixel perfection
- **Accessible by Default** - Built-in support for various accessibility needs
- **Cross-Platform** - Works seamlessly across web and native platforms
- **Maintainable** - Single source of truth for all design decisions
- **Scalable** - Easy to extend and customize

## Browser Support

- Chrome (last 3 versions)
- Firefox (last 3 versions)
- Safari (last 3 versions)
- Edge (last 3 versions)

## File Structure

```
design-token/
├── design-tokens.css    # Core design system
├── showcase.html        # Interactive documentation
├── README.md           # English documentation
└── README_zh.md        # Chinese documentation
```

## Contributing

Contributions are welcome! Please ensure any changes maintain:
- SwiftUI compatibility
- Accessibility standards
- Bilingual documentation
- The "60% good enough" philosophy

## License

MIT License - Use freely in personal and commercial projects.

## Credits

Created with a focus on practical, accessible design that works across platforms.