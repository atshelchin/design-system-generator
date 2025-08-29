# Design System Guide for LLMs
> A comprehensive guide for using the cross-platform design token system in both CSS and SwiftUI

## Overview

This design system provides a unified set of design tokens that work seamlessly across web (CSS) and native (SwiftUI) platforms. It includes colors, typography, spacing, shadows, radius, and accessibility features.

## Quick Start

### Web (CSS)
```html
<link rel="stylesheet" href="design-tokens.css">
```

### SwiftUI
```swift
import DesignTokensKit

// Use in your views
Text("Hello").foregroundColor(DesignTokens.Colors.primary)
```

## 1. Color System

### Core Colors

#### Brand Colors (Dynamic)
Brand colors adapt based on `--brand-hue` and `--brand-saturation` variables.

| Token | CSS Variable | SwiftUI | Description |
|-------|-------------|---------|-------------|
| Brand 50 | `var(--brand-50)` | `DesignTokens.Colors.brand50` | Lightest brand shade |
| Brand 100 | `var(--brand-100)` | `DesignTokens.Colors.brand100` | Very light |
| Brand 200 | `var(--brand-200)` | `DesignTokens.Colors.brand200` | Light |
| Brand 300 | `var(--brand-300)` | `DesignTokens.Colors.brand300` | Light medium |
| Brand 400 | `var(--brand-400)` | `DesignTokens.Colors.brand400` | Medium |
| Brand 500 | `var(--brand-500)` | `DesignTokens.Colors.brand500` | Base brand color |
| Brand 600 | `var(--brand-600)` | `DesignTokens.Colors.brand600` | Dark medium |
| Brand 700 | `var(--brand-700)` | `DesignTokens.Colors.brand700` | Dark |
| Brand 800 | `var(--brand-800)` | `DesignTokens.Colors.brand800` | Very dark |
| Brand 900 | `var(--brand-900)` | `DesignTokens.Colors.brand900` | Darkest |

#### Neutral Colors (Gray Scale)
| Token | CSS Variable | SwiftUI | Description |
|-------|-------------|---------|-------------|
| Gray 50 | `var(--gray-50)` | `DesignTokens.Colors.gray50` | Lightest gray |
| Gray 100 | `var(--gray-100)` | `DesignTokens.Colors.gray100` | Very light gray |
| Gray 200 | `var(--gray-200)` | `DesignTokens.Colors.gray200` | Light gray |
| Gray 300 | `var(--gray-300)` | `DesignTokens.Colors.gray300` | Light medium gray |
| Gray 400 | `var(--gray-400)` | `DesignTokens.Colors.gray400` | Medium gray |
| Gray 500 | `var(--gray-500)` | `DesignTokens.Colors.gray500` | Base gray |
| Gray 600 | `var(--gray-600)` | `DesignTokens.Colors.gray600` | Dark medium gray |
| Gray 700 | `var(--gray-700)` | `DesignTokens.Colors.gray700` | Dark gray |
| Gray 800 | `var(--gray-800)` | `DesignTokens.Colors.gray800` | Very dark gray |
| Gray 900 | `var(--gray-900)` | `DesignTokens.Colors.gray900` | Darkest gray |

### Semantic Colors

| Purpose | CSS Variable | SwiftUI | Light Mode | Dark Mode |
|---------|-------------|---------|------------|-----------|
| **Primary** | `var(--color-primary)` | `DesignTokens.Colors.primary` | brand-600 | brand-500 |
| Primary Text | `var(--color-primary-foreground)` | `DesignTokens.Colors.primaryForeground` | white | gray-900 |
| **Secondary** | `var(--color-secondary)` | `DesignTokens.Colors.secondary` | brand-100 | brand-900 |
| Secondary Text | `var(--color-secondary-foreground)` | `DesignTokens.Colors.secondaryForeground` | brand-700 | brand-200 |
| **Success** | `var(--color-success)` | `DesignTokens.Colors.success` | #22c55e | #6ee7b7 |
| **Warning** | `var(--color-warning)` | `DesignTokens.Colors.warning` | #f59e0b | #fcd34d |
| **Danger/Error** | `var(--color-danger)` | `DesignTokens.Colors.danger` | #ef4444 | #fca5a5 |
| **Info** | `var(--color-info)` | `DesignTokens.Colors.info` | #3b82f6 | #93c5fd |
| **Muted** | `var(--color-muted)` | `DesignTokens.Colors.muted` | gray-100 | gray-700 |
| Muted Text | `var(--color-muted-foreground)` | `DesignTokens.Colors.mutedForeground` | gray-600 | gray-400 |

### Functional Colors

| Purpose | CSS Variable | SwiftUI | Description |
|---------|-------------|---------|-------------|
| **Backgrounds** |
| Page Background | `var(--color-background)` | `DesignTokens.Colors.background` | Main page background |
| Card Background | `var(--color-card)` | `DesignTokens.Colors.card` | Card/panel background |
| Popover Background | `var(--color-popover)` | `DesignTokens.Colors.popover` | Popover/modal background |
| **Text** |
| Foreground | `var(--color-foreground)` | `DesignTokens.Colors.foreground` | Default text color |
| Card Text | `var(--color-card-foreground)` | `DesignTokens.Colors.cardForeground` | Text on cards |
| **Borders** |
| Border | `var(--color-border)` | `DesignTokens.Colors.border` | Default border color |
| Input Border | `var(--color-input)` | `DesignTokens.Colors.input` | Form input borders |
| Focus Ring | `var(--color-ring)` | `DesignTokens.Colors.ring` | Focus indicator |

### Usage Examples

#### CSS
```css
.button-primary {
    background: var(--color-primary);
    color: var(--color-primary-foreground);
    border: 1px solid var(--color-primary);
}

.card {
    background: var(--color-card);
    color: var(--color-card-foreground);
    border: 1px solid var(--color-border);
}

.alert-success {
    background: var(--color-success);
    color: white;
}
```

#### SwiftUI
```swift
Button("Primary Action") {
    // action
}
.background(DesignTokens.Colors.primary)
.foregroundColor(DesignTokens.Colors.primaryForeground)

VStack {
    Text("Card Content")
}
.background(DesignTokens.Colors.card)
.foregroundColor(DesignTokens.Colors.cardForeground)
.overlay(
    RoundedRectangle(cornerRadius: 8)
        .stroke(DesignTokens.Colors.border)
)
```

## 2. Typography System

### Font Sizes

| Size | CSS Variable | SwiftUI | Pixels | Rem |
|------|-------------|---------|--------|-----|
| XS | `var(--text-xs)` | `DesignTokens.Typography.textXS` | 12px | 0.75rem |
| SM | `var(--text-sm)` | `DesignTokens.Typography.textSM` | 14px | 0.875rem |
| Base | `var(--text-base)` | `DesignTokens.Typography.textBase` | 16px | 1rem |
| LG | `var(--text-lg)` | `DesignTokens.Typography.textLG` | 18px | 1.125rem |
| XL | `var(--text-xl)` | `DesignTokens.Typography.textXL` | 20px | 1.25rem |
| 2XL | `var(--text-2xl)` | `DesignTokens.Typography.text2XL` | 24px | 1.5rem |
| 3XL | `var(--text-3xl)` | `DesignTokens.Typography.text3XL` | 30px | 1.875rem |
| 4XL | `var(--text-4xl)` | `DesignTokens.Typography.text4XL` | 36px | 2.25rem |
| 5XL | `var(--text-5xl)` | `DesignTokens.Typography.text5XL` | 48px | 3rem |
| 6XL | `var(--text-6xl)` | `DesignTokens.Typography.text6XL` | 60px | 3.75rem |

### Font Weights

| Weight | CSS Variable | SwiftUI | Value |
|--------|-------------|---------|-------|
| Thin | `var(--font-thin)` | `.thin` | 100 |
| Light | `var(--font-light)` | `.light` | 300 |
| Normal | `var(--font-normal)` | `.regular` | 400 |
| Medium | `var(--font-medium)` | `.medium` | 500 |
| Semibold | `var(--font-semibold)` | `.semibold` | 600 |
| Bold | `var(--font-bold)` | `.bold` | 700 |
| Extrabold | `var(--font-extrabold)` | `.heavy` | 800 |
| Black | `var(--font-black)` | `.black` | 900 |

### Font Families

| Family | CSS Variable | SwiftUI | Fallbacks |
|--------|-------------|---------|-----------|
| Sans | `var(--font-family-sans)` | `.system` | system-ui, -apple-system, sans-serif |
| Mono | `var(--font-family-mono)` | `.monospaced` | 'SF Mono', Monaco, monospace |

### Usage Examples

#### CSS
```css
.heading {
    font-size: var(--text-2xl);
    font-weight: var(--font-bold);
    font-family: var(--font-family-sans);
}

.code {
    font-size: var(--text-sm);
    font-family: var(--font-family-mono);
}
```

#### SwiftUI
```swift
Text("Heading")
    .font(.system(size: DesignTokens.Typography.text2XL))
    .fontWeight(.bold)

Text("Code")
    .font(.system(size: DesignTokens.Typography.textSM, design: .monospaced))
```

## 3. Spacing System

### Space Values

| Token | CSS Variable | SwiftUI | Pixels | Scale Factor |
|-------|-------------|---------|--------|--------------|
| 0 | `var(--space-0)` | `DesignTokens.Spacing.space0` | 0px | 0 |
| 0.5 | `var(--space-0-5)` | `DesignTokens.Spacing.space0_5` | 2px | 0.5 |
| 1 | `var(--space-1)` | `DesignTokens.Spacing.space1` | 4px | 1 |
| 1.5 | `var(--space-1-5)` | `DesignTokens.Spacing.space1_5` | 6px | 1.5 |
| 2 | `var(--space-2)` | `DesignTokens.Spacing.space2` | 8px | 2 |
| 3 | `var(--space-3)` | `DesignTokens.Spacing.space3` | 12px | 3 |
| 4 | `var(--space-4)` | `DesignTokens.Spacing.space4` | 16px | 4 |
| 5 | `var(--space-5)` | `DesignTokens.Spacing.space5` | 20px | 5 |
| 6 | `var(--space-6)` | `DesignTokens.Spacing.space6` | 24px | 6 |
| 8 | `var(--space-8)` | `DesignTokens.Spacing.space8` | 32px | 8 |
| 10 | `var(--space-10)` | `DesignTokens.Spacing.space10` | 40px | 10 |
| 12 | `var(--space-12)` | `DesignTokens.Spacing.space12` | 48px | 12 |
| 16 | `var(--space-16)` | `DesignTokens.Spacing.space16` | 64px | 16 |
| 20 | `var(--space-20)` | `DesignTokens.Spacing.space20` | 80px | 20 |
| 24 | `var(--space-24)` | `DesignTokens.Spacing.space24` | 96px | 24 |

### Usage Examples

#### CSS
```css
.container {
    padding: var(--space-4);
    margin-bottom: var(--space-8);
    gap: var(--space-2);
}
```

#### SwiftUI
```swift
VStack(spacing: DesignTokens.Spacing.space4) {
    // content
}
.padding(DesignTokens.Spacing.space6)
```

## 4. Border Radius System

### Radius Values

| Token | CSS Variable | SwiftUI | Pixels | Notes |
|-------|-------------|---------|--------|-------|
| None | `var(--radius-none)` | `DesignTokens.Radius.none` | 0px | Square corners |
| SM | `var(--radius-sm)` | `DesignTokens.Radius.sm` | 4px | Small radius |
| Base | `var(--radius)` | `DesignTokens.Radius.base` | 6px | Default radius |
| MD | `var(--radius-md)` | `DesignTokens.Radius.md` | 8px | Medium radius |
| LG | `var(--radius-lg)` | `DesignTokens.Radius.lg` | 12px | Large radius |
| XL | `var(--radius-xl)` | `DesignTokens.Radius.xl` | 16px | Extra large |
| 2XL | `var(--radius-2xl)` | `DesignTokens.Radius.xxl` | 24px | 2x large |
| 3XL | `var(--radius-3xl)` | `DesignTokens.Radius.xxxl` | 30px | 3x large |
| Full | `var(--radius-full)` | `DesignTokens.Radius.full` | 9999px | Fully rounded |

### Usage Examples

#### CSS
```css
.card {
    border-radius: var(--radius-lg);
}

.button {
    border-radius: var(--radius);
}

.avatar {
    border-radius: var(--radius-full);
}
```

#### SwiftUI
```swift
Rectangle()
    .cornerRadius(DesignTokens.Radius.lg)

Circle() // For full radius
```

## 5. Shadow System

### Shadow Values

| Token | CSS Variable | SwiftUI | Description |
|-------|-------------|---------|-------------|
| XS | `var(--shadow-xs)` | `DesignTokens.Shadows.xs` | Extra small shadow |
| SM | `var(--shadow-sm)` | `DesignTokens.Shadows.sm` | Small shadow |
| Base | `var(--shadow)` | `DesignTokens.Shadows.base` | Default shadow |
| MD | `var(--shadow-md)` | `DesignTokens.Shadows.md` | Medium shadow |
| LG | `var(--shadow-lg)` | `DesignTokens.Shadows.lg` | Large shadow |
| XL | `var(--shadow-xl)` | `DesignTokens.Shadows.xl` | Extra large shadow |
| 2XL | `var(--shadow-2xl)` | `DesignTokens.Shadows.xxl` | 2x large shadow |
| Inner | `var(--shadow-inner)` | `DesignTokens.Shadows.inner` | Inner shadow |
| None | `var(--shadow-none)` | `DesignTokens.Shadows.none` | No shadow |

### Usage Examples

#### CSS
```css
.card {
    box-shadow: var(--shadow-md);
}

.button:hover {
    box-shadow: var(--shadow-lg);
}
```

#### SwiftUI
```swift
Rectangle()
    .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
```

## 6. Dark Mode Support

### Enabling Dark Mode

#### CSS
```css
/* Automatic (follows system preference) */
@media (prefers-color-scheme: dark) {
    /* Dark mode styles applied automatically */
}

/* Manual control */
[data-theme="dark"] {
    /* Dark mode styles */
}
```

```html
<!-- Force dark mode -->
<html data-theme="dark">

<!-- Toggle via JavaScript -->
<script>
document.documentElement.setAttribute('data-theme', 'dark');
</script>
```

#### SwiftUI
```swift
// In your app configuration
@StateObject private var config = DesignTokensConfig.shared

// Toggle dark mode
config.isDarkMode = true

// Apply to view
.preferredColorScheme(config.isDarkMode ? .dark : .light)
```

## 7. Accessibility Features

### Contrast Modes

| Mode | CSS Attribute | SwiftUI | Description |
|------|--------------|---------|-------------|
| Normal | `data-contrast="normal"` | `config.contrast = .normal` | Default contrast |
| High | `data-contrast="high"` | `config.contrast = .high` | Enhanced contrast |
| Ultra | `data-contrast="ultra"` | `config.contrast = .ultra` | Maximum contrast |

### Font Size Scaling

#### CSS
```html
<html data-font-size="large">  <!-- 1.125x -->
<html data-font-size="x-large">  <!-- 1.25x -->
<html data-font-size="xx-large">  <!-- 1.5x -->
```

#### SwiftUI
```swift
config.fontScale = 1.2  // 20% larger
```

### Line Height

#### CSS
```html
<html data-line-height="relaxed">  <!-- 1.8 -->
<html data-line-height="loose">  <!-- 2.2 -->
```

#### SwiftUI
```swift
config.lineHeight = .relaxed
```

### Letter Spacing

#### CSS
```html
<html data-letter-spacing="wide">
<html data-letter-spacing="wider">
```

#### SwiftUI
```swift
config.letterSpacing = .wide
```

## 8. Dynamic Customization

### Brand Customization

#### CSS
```css
:root {
    --brand-hue: 217;        /* 0-360 */
    --brand-saturation: 91%; /* 0-100% */
    --radius-scale: 1;       /* Multiplier for all radius values */
    --spacing-scale: 1;      /* Multiplier for all spacing values */
}
```

#### SwiftUI
```swift
let config = DesignTokensConfig.shared
config.brandHue = 217
config.brandSaturation = 91
config.radiusScale = 1.2
config.spacingScale = 1.1
```

## 9. Component Examples

### Button Component

#### CSS
```html
<button class="btn btn-primary">Primary Button</button>

<style>
.btn {
    padding: var(--space-2) var(--space-4);
    border-radius: var(--radius);
    font-size: var(--text-base);
    font-weight: var(--font-medium);
    transition: all 0.2s;
}

.btn-primary {
    background: var(--color-primary);
    color: var(--color-primary-foreground);
    border: 1px solid var(--color-primary);
}

.btn-primary:hover {
    opacity: 0.9;
    box-shadow: var(--shadow-md);
}
</style>
```

#### SwiftUI
```swift
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: DesignTokens.Typography.textBase))
                .fontWeight(.medium)
                .foregroundColor(DesignTokens.Colors.primaryForeground)
                .padding(.horizontal, DesignTokens.Spacing.space4)
                .padding(.vertical, DesignTokens.Spacing.space2)
                .background(DesignTokens.Colors.primary)
                .cornerRadius(DesignTokens.Radius.base)
        }
    }
}
```

### Card Component

#### CSS
```html
<div class="card">
    <h3 class="card-title">Card Title</h3>
    <p class="card-content">Card content goes here</p>
</div>

<style>
.card {
    background: var(--color-card);
    color: var(--color-card-foreground);
    padding: var(--space-4);
    border-radius: var(--radius-lg);
    border: 1px solid var(--color-border);
    box-shadow: var(--shadow-sm);
}

.card-title {
    font-size: var(--text-lg);
    font-weight: var(--font-semibold);
    margin-bottom: var(--space-2);
}
</style>
```

#### SwiftUI
```swift
struct Card: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignTokens.Spacing.space2) {
            Text(title)
                .font(.system(size: DesignTokens.Typography.textLG))
                .fontWeight(.semibold)
            
            Text(content)
                .font(.system(size: DesignTokens.Typography.textBase))
        }
        .padding(DesignTokens.Spacing.space4)
        .background(DesignTokens.Colors.card)
        .foregroundColor(DesignTokens.Colors.cardForeground)
        .cornerRadius(DesignTokens.Radius.lg)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.lg)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
    }
}
```

## 10. Best Practices

### Do's ✅

1. **Always use design tokens** instead of hardcoded values
2. **Support dark mode** by using semantic colors
3. **Test accessibility** with different contrast and font size settings
4. **Use spacing tokens** for consistent layouts
5. **Apply radius tokens** for consistent rounded corners

### Don'ts ❌

1. **Don't hardcode colors** - use semantic tokens
2. **Don't mix spacing units** - stick to the spacing scale
3. **Don't override system fonts** unnecessarily
4. **Don't ignore accessibility** settings
5. **Don't use pixel values** directly - use tokens

## 11. Migration Guide

### From Hard-coded Values to Design Tokens

#### Before (Bad)
```css
.button {
    background: #2563eb;
    padding: 8px 16px;
    border-radius: 6px;
    font-size: 14px;
}
```

#### After (Good)
```css
.button {
    background: var(--color-primary);
    padding: var(--space-2) var(--space-4);
    border-radius: var(--radius);
    font-size: var(--text-sm);
}
```

### SwiftUI Before/After

#### Before (Bad)
```swift
Text("Hello")
    .foregroundColor(Color(red: 37/255, green: 99/255, blue: 235/255))
    .padding(16)
```

#### After (Good)
```swift
Text("Hello")
    .foregroundColor(DesignTokens.Colors.primary)
    .padding(DesignTokens.Spacing.space4)
```

## 12. File Structure

```
design-token/
├── design-tokens.css           # CSS variables and styles
├── showcase.html               # Interactive web showcase
├── DesignTokensShowcase/       # SwiftUI implementation
│   ├── DesignTokens.swift     # Core token definitions
│   ├── ContentViewFinal.swift # Main SwiftUI view
│   └── ...                    # Supporting files
├── README.md                   # English documentation
├── README_zh.md               # Chinese documentation
└── DESIGN_SYSTEM_GUIDE.md    # This guide
```

## Summary

This design system provides:
- **165+ design tokens** covering all aspects of UI design
- **100% compatibility** between CSS and SwiftUI
- **Built-in dark mode** support with automatic switching
- **Accessibility features** including contrast modes and font scaling
- **Dynamic theming** with customizable brand colors
- **Responsive design** support with adaptive layouts

Use this guide to implement consistent, accessible, and beautiful interfaces across web and native platforms.