# Design System Quick Reference

## 🎯 Most Common Tokens

### Colors (CSS → SwiftUI)
```css
var(--color-primary)           → DesignTokens.Colors.primary
var(--color-secondary)         → DesignTokens.Colors.secondary
var(--color-background)        → DesignTokens.Colors.background
var(--color-foreground)        → DesignTokens.Colors.foreground
var(--color-card)              → DesignTokens.Colors.card
var(--color-border)            → DesignTokens.Colors.border
var(--color-success)           → DesignTokens.Colors.success
var(--color-danger)            → DesignTokens.Colors.danger
var(--color-warning)           → DesignTokens.Colors.warning
var(--color-muted)             → DesignTokens.Colors.muted
var(--color-muted-foreground)  → DesignTokens.Colors.mutedForeground
```

### Typography (CSS → SwiftUI)
```css
var(--text-xs)    → 12px  → DesignTokens.Typography.textXS
var(--text-sm)    → 14px  → DesignTokens.Typography.textSM
var(--text-base)  → 16px  → DesignTokens.Typography.textBase
var(--text-lg)    → 18px  → DesignTokens.Typography.textLG
var(--text-xl)    → 20px  → DesignTokens.Typography.textXL
var(--text-2xl)   → 24px  → DesignTokens.Typography.text2XL
var(--text-3xl)   → 30px  → DesignTokens.Typography.text3XL

var(--font-normal)   → 400  → .regular
var(--font-medium)   → 500  → .medium
var(--font-semibold) → 600  → .semibold
var(--font-bold)     → 700  → .bold
```

### Spacing (CSS → SwiftUI)
```css
var(--space-1)  → 4px   → DesignTokens.Spacing.space1
var(--space-2)  → 8px   → DesignTokens.Spacing.space2
var(--space-3)  → 12px  → DesignTokens.Spacing.space3
var(--space-4)  → 16px  → DesignTokens.Spacing.space4
var(--space-5)  → 20px  → DesignTokens.Spacing.space5
var(--space-6)  → 24px  → DesignTokens.Spacing.space6
var(--space-8)  → 32px  → DesignTokens.Spacing.space8
```

### Radius (CSS → SwiftUI)
```css
var(--radius-sm)   → 4px    → DesignTokens.Radius.sm
var(--radius)      → 6px    → DesignTokens.Radius.base
var(--radius-md)   → 8px    → DesignTokens.Radius.md
var(--radius-lg)   → 12px   → DesignTokens.Radius.lg
var(--radius-full) → 9999px → DesignTokens.Radius.full
```

### Shadows (CSS → SwiftUI)
```css
var(--shadow-sm)  → Small shadow   → shadow(radius: 2)
var(--shadow-md)  → Medium shadow  → shadow(radius: 6)
var(--shadow-lg)  → Large shadow   → shadow(radius: 10)
```

---

## 🚀 Quick Start Examples

### CSS Button
```css
.btn-primary {
    background: var(--color-primary);
    color: var(--color-primary-foreground);
    padding: var(--space-2) var(--space-4);
    border-radius: var(--radius);
    font-size: var(--text-base);
    font-weight: var(--font-medium);
}
```

### SwiftUI Button
```swift
Button("Click Me") { }
    .padding(.horizontal, DesignTokens.Spacing.space4)
    .padding(.vertical, DesignTokens.Spacing.space2)
    .background(DesignTokens.Colors.primary)
    .foregroundColor(DesignTokens.Colors.primaryForeground)
    .cornerRadius(DesignTokens.Radius.base)
```

### CSS Card
```css
.card {
    background: var(--color-card);
    color: var(--color-card-foreground);
    padding: var(--space-4);
    border: 1px solid var(--color-border);
    border-radius: var(--radius-lg);
    box-shadow: var(--shadow-sm);
}
```

### SwiftUI Card
```swift
VStack {
    // content
}
.padding(DesignTokens.Spacing.space4)
.background(DesignTokens.Colors.card)
.foregroundColor(DesignTokens.Colors.cardForeground)
.cornerRadius(DesignTokens.Radius.lg)
.overlay(
    RoundedRectangle(cornerRadius: DesignTokens.Radius.lg)
        .stroke(DesignTokens.Colors.border)
)
```

---

## 🌗 Dark Mode

### CSS
```html
<!-- Auto -->
<html> <!-- Follows system -->

<!-- Manual -->
<html data-theme="dark">

<!-- JavaScript -->
document.documentElement.setAttribute('data-theme', 'dark');
```

### SwiftUI
```swift
// Configure
DesignTokensConfig.shared.isDarkMode = true

// Apply to view
.preferredColorScheme(config.isDarkMode ? .dark : .light)
```

---

## ♿ Accessibility

### CSS
```html
<!-- Font size -->
<html data-font-size="large">     <!-- 1.125x -->
<html data-font-size="x-large">   <!-- 1.25x -->

<!-- Contrast -->
<html data-contrast="high">       <!-- High contrast -->
<html data-contrast="ultra">      <!-- Maximum contrast -->

<!-- Line height -->
<html data-line-height="relaxed"> <!-- 1.8 -->
<html data-line-height="loose">   <!-- 2.2 -->
```

### SwiftUI
```swift
let config = DesignTokensConfig.shared
config.fontScale = 1.2          // 20% larger
config.contrast = .high         // High contrast
config.lineHeight = .relaxed    // More spacing
```

---

## 🎨 Dynamic Theming

### CSS
```css
:root {
    --brand-hue: 217;        /* Change primary color hue */
    --brand-saturation: 91%; /* Adjust saturation */
    --radius-scale: 1.2;     /* 20% larger radius */
    --spacing-scale: 1.1;    /* 10% more spacing */
}
```

### SwiftUI
```swift
let config = DesignTokensConfig.shared
config.brandHue = 217           // Blue hue
config.brandSaturation = 91     // High saturation
config.radiusScale = 1.2        // Rounder corners
config.spacingScale = 1.1       // More spacing
```

---

## 📦 Installation

### Web
```html
<link rel="stylesheet" href="design-tokens.css">
```

### SwiftUI
```swift
import DesignTokensKit
```

---

## 🔍 Token Count
- **Colors**: 50+ tokens
- **Typography**: 20+ tokens  
- **Spacing**: 20+ tokens
- **Radius**: 9 tokens
- **Shadows**: 9 tokens
- **Total**: 165+ design tokens

---

## 📝 Notes for LLMs

1. **Always use semantic colors** (primary, secondary, success) instead of brand colors directly
2. **Dark mode is automatic** if you use the correct tokens
3. **Spacing uses a 4px base unit** (space-1 = 4px, space-2 = 8px, etc.)
4. **Font sizes use rem** in CSS but pixels in SwiftUI
5. **All tokens support dynamic scaling** via config variables
6. **Accessibility is built-in** - respect user preferences
7. **Cross-platform parity** - same visual result on web and native