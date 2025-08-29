# Design System API Reference

## CSS API

### Setup
```html
<link rel="stylesheet" href="design-tokens.css">
```

### Color Variables
```css
/* Brand Colors */
--brand-50 through --brand-900
--gray-50 through --gray-900

/* Semantic Colors */
--color-primary
--color-primary-foreground
--color-secondary
--color-secondary-foreground
--color-success
--color-warning
--color-danger
--color-info
--color-muted
--color-muted-foreground

/* Functional Colors */
--color-background
--color-foreground
--color-card
--color-card-foreground
--color-popover
--color-popover-foreground
--color-border
--color-input
--color-ring
--color-disabled
--color-disabled-foreground
--color-accent
--color-accent-foreground

/* Status Colors */
--color-positive
--color-negative
--color-neutral
--color-code
```

### Typography Variables
```css
/* Font Sizes */
--text-xs: 0.75rem    /* 12px */
--text-sm: 0.875rem   /* 14px */
--text-base: 1rem     /* 16px */
--text-lg: 1.125rem   /* 18px */
--text-xl: 1.25rem    /* 20px */
--text-2xl: 1.5rem    /* 24px */
--text-3xl: 1.875rem  /* 30px */
--text-4xl: 2.25rem   /* 36px */
--text-5xl: 3rem      /* 48px */
--text-6xl: 3.75rem   /* 60px */

/* Font Weights */
--font-thin: 100
--font-light: 300
--font-normal: 400
--font-medium: 500
--font-semibold: 600
--font-bold: 700
--font-extrabold: 800
--font-black: 900

/* Font Families */
--font-family-sans
--font-family-mono
```

### Spacing Variables
```css
--space-0: 0
--space-0-5: 0.125rem  /* 2px */
--space-1: 0.25rem     /* 4px */
--space-1-5: 0.375rem  /* 6px */
--space-2: 0.5rem      /* 8px */
--space-2-5: 0.625rem  /* 10px */
--space-3: 0.75rem     /* 12px */
--space-3-5: 0.875rem  /* 14px */
--space-4: 1rem        /* 16px */
--space-5: 1.25rem     /* 20px */
--space-6: 1.5rem      /* 24px */
--space-7: 1.75rem     /* 28px */
--space-8: 2rem        /* 32px */
--space-9: 2.25rem     /* 36px */
--space-10: 2.5rem     /* 40px */
--space-12: 3rem       /* 48px */
--space-14: 3.5rem     /* 56px */
--space-16: 4rem       /* 64px */
--space-20: 5rem       /* 80px */
--space-24: 6rem       /* 96px */
```

### Radius Variables
```css
--radius-none: 0
--radius-sm: 0.25rem   /* 4px */
--radius: 0.375rem     /* 6px */
--radius-md: 0.5rem    /* 8px */
--radius-lg: 0.75rem   /* 12px */
--radius-xl: 1rem      /* 16px */
--radius-2xl: 1.5rem   /* 24px */
--radius-3xl: 1.875rem /* 30px */
--radius-full: 9999px
```

### Shadow Variables
```css
--shadow-xs
--shadow-sm
--shadow
--shadow-md
--shadow-lg
--shadow-xl
--shadow-2xl
--shadow-inner
--shadow-none
```

### Configuration Variables
```css
:root {
    --brand-hue: 217;        /* 0-360 */
    --brand-saturation: 91%; /* 0-100% */
    --radius-scale: 1;       /* Multiplier */
    --spacing-scale: 1;      /* Multiplier */
    --font-scale: 1;         /* Multiplier */
    --contrast-mode: normal; /* normal|high|ultra */
    --letter-spacing: normal;
    --line-height: 1.6;
}
```

### HTML Attributes
```html
<!-- Theme -->
<html data-theme="dark|light">

<!-- Accessibility -->
<html data-contrast="normal|high|ultra">
<html data-font-size="small|normal|large|x-large|xx-large">
<html data-line-height="tight|normal|relaxed|loose">
<html data-letter-spacing="normal|wide|wider|widest">
```

---

## SwiftUI API

### Import
```swift
import DesignTokensKit
```

### Configuration
```swift
let config = DesignTokensConfig.shared

// Theme
config.isDarkMode: Bool

// Brand customization
config.brandHue: Double         // 0-360
config.brandSaturation: Double  // 0-100

// Scaling
config.fontScale: Double        // Default: 1.0
config.radiusScale: Double      // Default: 1.0
config.spacingScale: Double     // Default: 1.0

// Accessibility
config.contrast: ContrastMode   // .normal, .high, .ultra
config.letterSpacing: LetterSpacingMode // .normal, .wide, .wider, .widest
config.lineHeight: LineHeightMode // .tight, .normal, .relaxed, .loose
```

### Colors
```swift
// Brand colors
DesignTokens.Colors.brand50
DesignTokens.Colors.brand100
DesignTokens.Colors.brand200
DesignTokens.Colors.brand300
DesignTokens.Colors.brand400
DesignTokens.Colors.brand500
DesignTokens.Colors.brand600
DesignTokens.Colors.brand700
DesignTokens.Colors.brand800
DesignTokens.Colors.brand900

// Gray scale
DesignTokens.Colors.gray50
DesignTokens.Colors.gray100
DesignTokens.Colors.gray200
DesignTokens.Colors.gray300
DesignTokens.Colors.gray400
DesignTokens.Colors.gray500
DesignTokens.Colors.gray600
DesignTokens.Colors.gray700
DesignTokens.Colors.gray800
DesignTokens.Colors.gray900

// Semantic colors
DesignTokens.Colors.primary
DesignTokens.Colors.primaryForeground
DesignTokens.Colors.secondary
DesignTokens.Colors.secondaryForeground
DesignTokens.Colors.success
DesignTokens.Colors.warning
DesignTokens.Colors.danger (alias: .error)
DesignTokens.Colors.info
DesignTokens.Colors.muted
DesignTokens.Colors.mutedForeground

// Functional colors
DesignTokens.Colors.background
DesignTokens.Colors.foreground
DesignTokens.Colors.card
DesignTokens.Colors.cardForeground
DesignTokens.Colors.popover
DesignTokens.Colors.popoverForeground
DesignTokens.Colors.border
DesignTokens.Colors.input
DesignTokens.Colors.ring
DesignTokens.Colors.disabled
DesignTokens.Colors.disabledForeground
DesignTokens.Colors.accent
DesignTokens.Colors.accentForeground

// Status colors
DesignTokens.Colors.positive
DesignTokens.Colors.negative
DesignTokens.Colors.neutral
DesignTokens.Colors.code

// Helper methods
DesignTokens.Colors.brandColor(for: Int) -> Color
DesignTokens.Colors.grayColor(for: Int) -> Color
```

### Typography
```swift
// Font sizes (CGFloat)
DesignTokens.Typography.textXS    // 12
DesignTokens.Typography.textSM    // 14
DesignTokens.Typography.textBase  // 16
DesignTokens.Typography.textLG    // 18
DesignTokens.Typography.textXL    // 20
DesignTokens.Typography.text2XL   // 24
DesignTokens.Typography.text3XL   // 30
DesignTokens.Typography.text4XL   // 36
DesignTokens.Typography.text5XL   // 48
DesignTokens.Typography.text6XL   // 60

// Font weights (Font.Weight)
Font.Weight.thin       // 100
Font.Weight.light      // 300
Font.Weight.regular    // 400
Font.Weight.medium     // 500
Font.Weight.semibold   // 600
Font.Weight.bold       // 700
Font.Weight.heavy      // 800
Font.Weight.black      // 900

// Usage
Text("Hello")
    .font(.system(size: DesignTokens.Typography.textLG))
    .fontWeight(.semibold)
```

### Spacing
```swift
// Spacing values (CGFloat)
DesignTokens.Spacing.space0     // 0
DesignTokens.Spacing.space0_5   // 2
DesignTokens.Spacing.space1     // 4
DesignTokens.Spacing.space1_5   // 6
DesignTokens.Spacing.space2     // 8
DesignTokens.Spacing.space2_5   // 10
DesignTokens.Spacing.space3     // 12
DesignTokens.Spacing.space3_5   // 14
DesignTokens.Spacing.space4     // 16
DesignTokens.Spacing.space5     // 20
DesignTokens.Spacing.space6     // 24
DesignTokens.Spacing.space7     // 28
DesignTokens.Spacing.space8     // 32
DesignTokens.Spacing.space9     // 36
DesignTokens.Spacing.space10    // 40
DesignTokens.Spacing.space12    // 48
DesignTokens.Spacing.space14    // 56
DesignTokens.Spacing.space16    // 64
DesignTokens.Spacing.space20    // 80
DesignTokens.Spacing.space24    // 96

// Usage
.padding(DesignTokens.Spacing.space4)
VStack(spacing: DesignTokens.Spacing.space2)
```

### Radius
```swift
// Radius values (CGFloat)
DesignTokens.Radius.none   // 0
DesignTokens.Radius.sm     // 4
DesignTokens.Radius.base   // 6
DesignTokens.Radius.md     // 8
DesignTokens.Radius.lg     // 12
DesignTokens.Radius.xl     // 16
DesignTokens.Radius.xxl    // 24
DesignTokens.Radius.xxxl   // 30
DesignTokens.Radius.full   // 9999

// Usage
.cornerRadius(DesignTokens.Radius.lg)
```

### Shadows
```swift
// SwiftUI doesn't have direct shadow tokens, use:
.shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)  // sm
.shadow(color: Color.black.opacity(0.1), radius: 6, y: 3)   // md
.shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)  // lg
.shadow(color: Color.black.opacity(0.15), radius: 20, y: 10) // xl
```

---

## Common Patterns

### CSS Component Template
```css
.component {
    /* Layout */
    padding: var(--space-4);
    margin: var(--space-2);
    gap: var(--space-2);
    
    /* Colors */
    background: var(--color-card);
    color: var(--color-card-foreground);
    border: 1px solid var(--color-border);
    
    /* Typography */
    font-size: var(--text-base);
    font-weight: var(--font-medium);
    font-family: var(--font-family-sans);
    
    /* Style */
    border-radius: var(--radius-lg);
    box-shadow: var(--shadow-sm);
    
    /* Interaction */
    transition: all 0.2s ease;
}

.component:hover {
    box-shadow: var(--shadow-md);
    border-color: var(--color-primary);
}

.component:focus {
    outline: 2px solid var(--color-ring);
    outline-offset: 2px;
}
```

### SwiftUI Component Template
```swift
struct ComponentView: View {
    @ObservedObject var config = DesignTokensConfig.shared
    
    var body: some View {
        VStack(spacing: DesignTokens.Spacing.space2) {
            // Content
        }
        .padding(DesignTokens.Spacing.space4)
        .background(DesignTokens.Colors.card)
        .foregroundColor(DesignTokens.Colors.cardForeground)
        .cornerRadius(DesignTokens.Radius.lg * config.radiusScale)
        .overlay(
            RoundedRectangle(cornerRadius: DesignTokens.Radius.lg * config.radiusScale)
                .stroke(DesignTokens.Colors.border, lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
    }
}
```

---

## Type Definitions

### SwiftUI Types
```swift
// Enums
enum ContrastMode {
    case normal
    case high
    case ultra
}

enum LetterSpacingMode {
    case normal
    case wide
    case wider
    case widest
}

enum LineHeightMode {
    case tight
    case normal
    case relaxed
    case loose
}

// Configuration Class
class DesignTokensConfig: ObservableObject {
    static let shared = DesignTokensConfig()
    
    @Published var brandHue: Double
    @Published var brandSaturation: Double
    @Published var fontScale: Double
    @Published var radiusScale: Double
    @Published var spacingScale: Double
    @Published var isDarkMode: Bool
    @Published var contrast: ContrastMode
    @Published var letterSpacing: LetterSpacingMode
    @Published var lineHeight: LineHeightMode
}
```

---

## Code Generation Tips for LLMs

1. **Always use tokens**, never hardcode values
2. **Chain tokens** for compound styles: `padding: var(--space-2) var(--space-4);`
3. **Use semantic colors** for automatic dark mode support
4. **Apply scales** through config: `* config.radiusScale`
5. **Test accessibility** by changing contrast and font scale
6. **Prefer system fonts** unless specifically overridden
7. **Match platforms**: Same token = same visual result