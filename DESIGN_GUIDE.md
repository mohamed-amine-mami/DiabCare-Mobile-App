# 🎨 DiabCare Design System Guide

## Visual Design Overview

This document provides a comprehensive guide to the DiabCare Professional Edition design system, ensuring consistency across all screens and components.

---

## 🌈 Color System

### Primary Palette

| Color Name | Hex Code | RGB | Usage |
|------------|----------|-----|-------|
| **Soft Green** | `#7DDAB9` | rgb(125, 218, 185) | Primary actions, success states, main brand color |
| **Light Blue** | `#9BC4E2` | rgb(155, 196, 226) | Secondary elements, information displays |
| **White** | `#FFFEFF` | rgb(255, 254, 255) | Card backgrounds, surfaces |
| **Background** | `#F8FAFB` | rgb(248, 250, 251) | Screen backgrounds |

### Accent Colors

| Color Name | Hex Code | Purpose |
|------------|----------|---------|
| **Pastel Green** | `#B7E4C7` | Success confirmations, positive indicators |
| **Soft Orange** | `#FDB777` | Alerts, warnings (non-aggressive) |

### Status Colors

| Status | Color | Hex Code | When to Use |
|--------|-------|----------|-------------|
| **Stable** | Green | `#95D5B2` | Normal patient condition |
| **Attention** | Yellow | `#FFD97D` | Requires monitoring |
| **Critical** | Soft Red | `#FFB4A2` | Urgent attention needed |

### Text Colors

| Type | Color | Hex Code | Usage |
|------|-------|----------|-------|
| **Primary Text** | Dark Gray | `#2D3748` | Headings, important text |
| **Secondary Text** | Medium Gray | `#718096` | Body text, labels |
| **Light Text** | Light Gray | `#A0AEC0` | Hints, timestamps, tertiary info |

### Dark Mode Colors

| Element | Color | Hex Code |
|---------|-------|----------|
| **Background** | Dark Blue-Gray | `#1A202C` |
| **Card** | Medium Blue-Gray | `#2D3748` |
| **Soft Green (Dark)** | Muted Green | `#5FB89A` |
| **Light Blue (Dark)** | Muted Blue | `#7AA5C4` |

---

## 📏 Typography

### Font Family
- **Primary**: SF Pro (fallback: system-ui, Segoe UI, Roboto)
- **Weight Options**: Regular (400), Medium (500), Semibold (600), Bold (700)

### Type Scale

| Style | Size | Weight | Line Height | Usage |
|-------|------|--------|-------------|-------|
| **Headline Large** | 28px | Bold | 1.2 | Screen titles |
| **Headline Medium** | 24px | Semibold | 1.3 | Section headers |
| **Headline Small** | 20px | Semibold | 1.4 | Card titles |
| **Body Large** | 16px | Regular | 1.5 | Main content |
| **Body Medium** | 14px | Regular | 1.5 | Secondary content |
| **Caption** | 12px | Regular | 1.4 | Labels, metadata |
| **Button Text** | 16px | Semibold | 1.2 | Buttons, CTAs |

---

## 🧩 Component Library

### 1. Cards

**Standard Card**
- Border Radius: `16px`
- Elevation: `2dp`
- Background: White (`#FFFEFF`)
- Padding: `16-20px`
- Shadow: Soft, colored based on context

```dart
Container(
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: AppColors.lightBlue.withOpacity(0.1),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  ),
)
```

**Gradient Card** (Featured content)
- Gradient: Soft Green → Light Blue (20% opacity)
- Border: 2px white
- Border Radius: `20px`

### 2. Buttons

**Primary Button**
- Background: Soft Green (`#7DDAB9`)
- Text: White
- Border Radius: `12px`
- Padding: `16px vertical, 24px horizontal`
- Height: `48px` minimum

**Secondary Button (Outlined)**
- Border: 2px Soft Green/Light Blue
- Text: Matching border color
- Background: Transparent
- Same dimensions as primary

**Icon Button**
- Size: `40x40px`
- Border Radius: `12px`
- Background: Color with 20% opacity

### 3. Input Fields

**Text Field**
- Background: White
- Border Radius: `16px`
- No border (filled style)
- Focus: 2px Soft Green border
- Padding: `16px`
- Height: `56px` minimum

**Search Bar**
- Same as text field
- Prefix Icon: Search (gray)
- Suffix Icon: Filter (optional)

### 4. Status Badges

**Small Badge**
- Border Radius: `8px`
- Padding: `4px 8px`
- Font Size: `11px`
- Font Weight: Semibold

**Medium Badge**
- Border Radius: `12px`
- Padding: `6px 12px`
- Font Size: `12px`

### 5. Navigation

**Bottom Navigation Bar**
- Background: White
- Height: `64px`
- Elevation: `8dp`
- Selected Color: Soft Green
- Unselected Color: Light Gray

**Tab Bar**
- Background: White
- Indicator: 3px Soft Green underline
- Border Radius: `12px` container

### 6. Progress Indicators

**Linear Progress**
- Height: `8px`
- Border Radius: `4px`
- Background: Light background
- Value Color: Status-based

**Circular Avatar/Status**
- Small: `32px`
- Medium: `56px`
- Large: `80px`
- Border: 2-3px white for status overlay

### 7. Icons

**Sizes**
- Small: `16px`
- Medium: `20px`
- Large: `24px`
- Extra Large: `48px` (placeholders)

**Style**: Outlined (default), Filled (active states)

---

## 📐 Spacing System

Use multiples of 4 for consistent spacing:

| Token | Value | Usage |
|-------|-------|-------|
| `xs` | 4px | Tight spacing |
| `sm` | 8px | Compact layouts |
| `md` | 12px | Default spacing |
| `lg` | 16px | Comfortable spacing |
| `xl` | 20px | Section spacing |
| `2xl` | 24px | Major sections |
| `3xl` | 32px | Screen padding |

---

## 🎯 Screen Layouts

### Standard Screen Structure

```
AppBar (56px height)
├── Leading: Icon/Avatar
├── Title: Screen name
└── Actions: Icons

Body
├── Padding: 20px horizontal
├── ScrollView (if needed)
└── Content sections

Bottom Navigation (64px height)
└── 5 tabs with icons + labels
```

### Card Grid Layout

**Two Columns**
- Column spacing: `16px`
- Row spacing: `16px`
- Cards: Equal width (flexible)

**Responsive Breakpoints**
- Mobile: 1 column for detailed cards
- Tablet: 2 columns
- Desktop: 3-4 columns

---

## 🌊 Animations & Transitions

### Duration Standards
- **Fast**: 150ms - Button feedback, toggles
- **Normal**: 300ms - Screen transitions, cards
- **Slow**: 500ms - Complex animations

### Curves
- **Standard**: `easeInOut` - General use
- **Decelerate**: `easeOut` - Entering elements
- **Accelerate**: `easeIn` - Exiting elements

### Effects
- **Ripple**: Material ripple on all tappable surfaces
- **Shadow**: Elevate on hover (web/desktop)
- **Scale**: Slight scale (0.98) on press

---

## ♿ Accessibility

### Touch Targets
- Minimum: `44x44px` (iOS), `48x48px` (Android)
- Spacing: Minimum `8px` between interactive elements

### Contrast Ratios
- Text on Background: Minimum 4.5:1 (AA)
- Large Text: Minimum 3:1
- Icons: Minimum 3:1

### Text Sizing
- Support dynamic type/font scaling
- Test at 200% zoom
- Minimum body text: 14px

### Screen Reader Support
- All interactive elements have labels
- Status changes announced
- Error messages accessible

---

## 📱 Responsive Design

### Breakpoints

| Device | Width | Layout Changes |
|--------|-------|----------------|
| **Mobile** | < 600px | Single column, stacked |
| **Tablet** | 600-1024px | Two columns, expanded cards |
| **Desktop** | > 1024px | Sidebar navigation, multi-column |

### Orientation
- **Portrait**: Optimized for scrolling
- **Landscape**: Utilize horizontal space for charts

---

## 🎨 Design Patterns

### Data Visualization

**Charts**
- Background: Subtle gradient (10% opacity)
- Grid: Light gray, minimal
- Data Points: High contrast colors
- Labels: 12px, secondary text color

**Status Indicators**
- Use color + icon (not color alone)
- Shape variations for colorblind users
- Always include text labels

### Empty States
- Icon: 48px, 50% opacity
- Title: Body large, semibold
- Message: Body medium, secondary color
- Action: Primary button (optional)

### Loading States
- Skeleton screens matching content layout
- Shimmer effect: Soft gradient animation
- Color: Light gray on white

### Error States
- Icon: Soft orange (not red)
- Clear, actionable message
- Retry button when applicable

---

## 📋 Best Practices

### DO ✅
- Use rounded corners consistently (12-16px)
- Maintain 20px screen padding
- Use soft shadows (low opacity, colored)
- Group related content in cards
- Provide visual feedback for all interactions
- Use status colors with icons
- Include helpful empty states

### DON'T ❌
- Use harsh red colors (use soft orange)
- Create cards without rounded corners
- Mix different border radius values randomly
- Overcrowd information
- Use color as the only indicator
- Forget touch target sizes
- Skip loading states

---

## 🔍 Component Examples

### Alert Card (Critical)
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(
      color: AppColors.softOrange.withOpacity(0.5),
      width: 1.5,
    ),
  ),
  // Content...
)
```

### Patient Status Badge
```dart
Container(
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: statusColor.withOpacity(0.2),
    borderRadius: BorderRadius.circular(12),
  ),
  child: Row(
    children: [
      Icon(statusIcon, size: 14),
      SizedBox(width: 4),
      Text(status, style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      )),
    ],
  ),
)
```

---

## 🚀 Implementation Tips

1. **Create reusable components** for common patterns
2. **Use theme data** from `app_theme.dart`
3. **Test on multiple devices** and screen sizes
4. **Consider dark mode** from the beginning
5. **Profile performance** for animations
6. **Use const constructors** when possible
7. **Follow Material Design 3** guidelines where applicable

---

## 📞 Design System Maintenance

- **Version**: 1.0.0
- **Last Updated**: February 2024
- **Review Cycle**: Quarterly
- **Feedback**: Collect from doctors using the app

---

*This design system ensures DiabCare maintains a professional, calming, and trustworthy appearance suitable for daily medical use.*

