# 🎨 DiabCare Visual Mockup Guide

## Screen Previews & Layout Descriptions

This document describes the visual appearance of each screen to help you understand the design.

---

## 🏠 Dashboard Screen

```
┌─────────────────────────────────────────┐
│  🏥 DiabCare                       🔔(3)│
│  Professional Edition                   │
├─────────────────────────────────────────┤
│                                         │
│  Welcome back, Dr. Sarah                │
│  Here's your overview for today         │
│                                         │
│  ┌──────────┐  ┌──────────┐            │
│  │ 👥       │  │ 📅       │            │
│  │ 248      │  │ 12       │            │
│  │ Total    │  │ Appoint- │            │
│  │ Patients │  │ ments    │            │
│  └──────────┘  └──────────┘            │
│                                         │
│  ┌──────────┐  ┌──────────┐            │
│  │ 📈       │  │ ⚠️       │            │
│  │ 28       │  │ 3        │            │
│  │ Active   │  │ Alerts   │            │
│  │ Today    │  │          │            │
│  └──────────┘  └──────────┘            │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ Average Glucose Levels  📊      │   │
│  │ ┌─────────────────────────────┐ │   │
│  │ │     [Line Chart]            │ │   │
│  │ │  Weekly average: 125 mg/dL  │ │   │
│  │ └─────────────────────────────┘ │   │
│  └─────────────────────────────────┘   │
│                                         │
│  Critical Alerts                        │
│  ┌─────────────────────────────────┐   │
│  │ ⚠️  John Doe                    │   │
│  │     High Glucose: 280 mg/dL     │   │
│  │     10 mins ago              →  │   │
│  └─────────────────────────────────┘   │
│                                         │
├─────────────────────────────────────────┤
│ 🏠  👥  📅  🔔  👤                     │
│ Dash Pati Appt Alert Prof             │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Stats cards: White with soft green/blue shadows
- Chart: Light blue gradient background
- Alerts: Soft orange border for urgent items

---

## 👥 Patients List Screen

```
┌─────────────────────────────────────────┐
│  ← Patients                      ⋮      │
├─────────────────────────────────────────┤
│  🔍 Search patients...           🎛️    │
│                                         │
│  [All] Stable Attention Critical        │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 👤 Patient 1               ✓    │   │
│  │    45 years • Type 1           │   │
│  │    🩸 120 mg/dL  📊 Risk: Low  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 👤 Patient 2               ⚠️   │   │
│  │    52 years • Type 2           │   │
│  │    🩸 155 mg/dL  📊 Risk: Med  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 👤 Patient 3               🔴   │   │
│  │    68 years • Type 2           │   │
│  │    🩸 280 mg/dL  📊 Risk: High │   │
│  └─────────────────────────────────┘   │
│                                         │
│                              [+ Patient]│
├─────────────────────────────────────────┤
│ 🏠  👥  📅  🔔  👤                     │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Search bar: White background
- Filter chips: Soft green when selected
- Status badges: Green (stable), yellow (attention), soft red (critical)

---

## 📋 Patient Details Screen

```
┌─────────────────────────────────────────┐
│  ← Patient Details          ✏️  ⋮       │
├─────────────────────────────────────────┤
│  ┌─────────────────────────────────┐   │
│  │  👤  John Doe            ✓      │   │
│  │      52 years • Type 2          │   │
│  │      [Stable Condition]         │   │
│  └─────────────────────────────────┘   │
│                                         │
│  Overview Readings History Notes        │
│  ─────────                              │
│                                         │
│  ┌──────┐ ┌──────┐ ┌──────┐           │
│  │ 125  │ │ 6.8% │ │ Low  │           │
│  │mg/dL │ │HbA1c │ │Risk  │           │
│  └──────┘ └──────┘ └──────┘           │
│                                         │
│  🙍 Personal Information                │
│  ┌─────────────────────────────────┐   │
│  │ Email: john.doe@email.com       │   │
│  │ Phone: +1 (555) 123-4567        │   │
│  │ Blood Type: O+                  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  💊 Current Treatment                   │
│  ┌─────────────────────────────────┐   │
│  │ 💊 Metformin 500mg              │   │
│  │    Twice daily                  │   │
│  │ 💊 Insulin Glargine 10 units    │   │
│  │    Before bedtime               │   │
│  └─────────────────────────────────┘   │
│                                         │
│  🤖 AI-Based Insights                   │
│  ┌─────────────────────────────────┐   │
│  │ 📈 Glucose trending upward...   │   │
│  │ ✅ Medication adherence: 98%    │   │
│  └─────────────────────────────────┘   │
│                                         │
│                          [📅 Schedule]  │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Header: Soft green-blue gradient
- Quick stats: Color-coded (green, blue, green)
- AI insights: Light green background

---

## 📅 Appointments Screen

```
┌─────────────────────────────────────────┐
│  Appointments              📋 📅        │
├─────────────────────────────────────────┤
│  ┌─────────────────────────────────┐   │
│  │  ← February 2024 →              │   │
│  │  Mo Tu We Th Fr Sa Su           │   │
│  │  1  2  3• 4  5  6  7            │   │
│  │  8  9  10 11 12 13 14           │   │
│  └─────────────────────────────────┘   │
│                                         │
│  All Confirmed(8) Pending(3) Done(45)   │
│                                         │
│  Today - Feb 8, 2024                    │
│  ┌─────────────────────────────────┐   │
│  │ 🕐   👤 John Doe                │   │
│  │ 9:00  🎥 Online [Confirmed]     │   │
│  │ AM                           ⋮  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 🕐   👤 Mary Smith              │   │
│  │10:30  🏥 Physical [Confirmed]   │   │
│  │ AM                           ⋮  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  Tomorrow - Feb 9, 2024                 │
│  ┌─────────────────────────────────┐   │
│  │ 🕐   👤 Emma Davis              │   │
│  │ 9:30  🏥 Physical [Confirmed]   │   │
│  │ AM                           ⋮  │   │
│  └─────────────────────────────────┘   │
│                                         │
│                    [+ New Appointment]  │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Calendar: Selected date in soft green
- Appointment dots: Soft orange indicators
- Online: Light blue badge
- Physical: Soft green badge

---

## 🔔 Notifications Screen

```
┌─────────────────────────────────────────┐
│  ← Notifications          Mark all read │
├─────────────────────────────────────────┤
│  Today                                  │
│  ┌─────────────────────────────────┐   │
│  │ ⚠️ Critical Alert: High Glucose •│   │
│  │    John Doe's glucose is 280... │   │
│  │    10 mins ago                  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 📅 Appointment Reminder         │   │
│  │    Meeting with Mary Smith...   │   │
│  │    30 mins ago                  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  Yesterday                              │
│  ┌─────────────────────────────────┐   │
│  │ ⚠️ Low Glucose Alert            │   │
│  │    Emma Davis glucose dropped   │   │
│  │    Yesterday, 8:30 PM           │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 💬 New Message                  │   │
│  │    Patient sent you a message   │   │
│  │    Yesterday, 3:15 PM           │   │
│  └─────────────────────────────────┘   │
│                                         │
├─────────────────────────────────────────┤
│ 🏠  👥  📅  🔔  👤                     │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Unread: Subtle background tint, colored border
- Critical: Soft orange
- Appointments: Light blue
- Messages: Soft green

---

## 👨‍⚕️ Doctor Profile Screen

```
┌─────────────────────────────────────────┐
│  My Profile                             │
├─────────────────────────────────────────┤
│  ┌─────────────────────────────────┐   │
│  │         👤 📷                    │   │
│  │    Dr. Sarah Johnson            │   │
│  │  [Diabetologist & Endo...]      │   │
│  │                                 │   │
│  │  📧 sarah.johnson@medical.com   │   │
│  │  📱 +1 (555) 123-4567          │   │
│  │  🆔 License: MD-123456         │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 📡 Availability Status      ON  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ This Month Statistics           │   │
│  │ 156      89%      12            │   │
│  │ Consult  Satisf   Reviews       │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ ✏️  Edit Profile              → │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 🔒 Change Password            → │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ 🌙 Dark Mode                 OFF│   │
│  └─────────────────────────────────┘   │
│                                         │
│  [Logout]                               │
├─────────────────────────────────────────┤
│ 🏠  👥  📅  🔔  👤                     │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Profile header: Gradient background
- Settings cards: White with icon color accents
- Logout: Soft red/orange

---

## 📊 Medical Reports Screen

```
┌─────────────────────────────────────────┐
│  ← Medical Reports              🎛️      │
├─────────────────────────────────────────┤
│  [Daily] [Weekly] [Monthly]             │
│                                         │
│  ┌──────────┐  ┌──────────┐            │
│  │ 🩸 125   │  │ 💊 94%   │            │
│  │ mg/dL    │  │ Adher.   │            │
│  │ ↑ +2.5%  │  │ ↑ +5%    │            │
│  └──────────┘  └──────────┘            │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ Blood Sugar Trends     📊       │   │
│  │ ━ Fasting  ━ Post-meal          │   │
│  │ ┌─────────────────────────────┐ │   │
│  │ │    [Line Chart]             │ │   │
│  │ │ Target: 80-130 mg/dL        │ │   │
│  │ └─────────────────────────────┘ │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ Medication Adherence            │   │
│  │ ████████████████░ 94% ░ 6%      │   │
│  │ ━ Taken 94%  ━ Missed 6%        │   │
│  └─────────────────────────────────┘   │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │ ✏️ Add Comments                 │   │
│  │ ┌─────────────────────────────┐ │   │
│  │ │ Add observations...         │ │   │
│  │ └─────────────────────────────┘ │   │
│  │ [Save Comment]                  │   │
│  └─────────────────────────────────┘   │
│                                         │
│  [📥 Export PDF] [🔗 Share Report]     │
└─────────────────────────────────────────┘
```

**Color Notes**:
- Period selector: Soft green when selected
- Charts: Light blue/green gradients
- Progress bars: Color-coded by status

---

## 🎨 Color Reference

### Component Colors

| Element | Normal | Hover/Active | Background |
|---------|--------|--------------|------------|
| Primary Button | Soft Green | Darker Green | White text |
| Secondary Button | Border: Light Blue | Fill: Light Blue | Blue text |
| Cards | White | - | Soft shadow |
| Links/Text Buttons | Soft Green | Darker | Transparent |
| Status: Stable | Green (#95D5B2) | - | Green 20% |
| Status: Attention | Yellow (#FFD97D) | - | Yellow 20% |
| Status: Critical | Soft Red (#FFB4A2) | - | Red 20% |

---

## 📐 Spacing Guide

```
Screen Padding: 20px
Card Padding: 20px
Card Margin: 12px
Section Spacing: 24px
Element Spacing: 8-16px
Border Radius: 12-16px
Icon Size: 20-24px
Touch Target: 48x48px min
```

---

## 🎯 Interaction States

### Button States
```
Normal:    [Button Text]
Hover:     [Button Text] (slightly darker)
Pressed:   [Button Text] (scale: 0.98)
Disabled:  [Button Text] (50% opacity)
```

### Card States
```
Normal:    No border, subtle shadow
Hover:     Slight elevation increase
Pressed:   Brief scale animation
Selected:  Colored border (2px)
```

---

## 🌈 Visual Hierarchy

**Priority 1** (Highest):
- Critical alerts
- Primary CTAs
- Patient names
- Key metrics

**Priority 2** (Medium):
- Section headers
- Status badges
- Secondary actions
- Chart data

**Priority 3** (Low):
- Timestamps
- Help text
- Tertiary actions
- Metadata

---

**This visual guide helps ensure consistent implementation across all screens**

*DiabCare Professional Edition - Visual Mockup Guide v1.0*

