
# 🎨 Guide Visuel - Nouvelle UI DiabCare

## 🌟 Bottom Navigation Bar

### Design Moderne
```
┌─────────────────────────────────────┐
│  ╭─────────────────────────────╮   │
│  │                             │   │
│  │  [🏠]    [💊]    [👤]      │   │ <- Ancienne version (emoji)
│  │ Accueil Demandes Profil     │   │
│  ╰─────────────────────────────╯   │
└─────────────────────────────────────┘

        ⬇️  TRANSFORMATION  ⬇️

┌─────────────────────────────────────┐
│ ╭───────────────────────────────╮  │
│ │                               │  │
│ │ ┌─────┐  ┌──────┐  ┌─────┐  │  │
│ │ │ 🏠  │  │  💊  │  │ 👤  │  │  │ <- Nouvelle version
│ │ │Home │  │Meds🔴│  │User │  │  │    (Material Icons + Gradient)
│ │ └─────┘  └──────┘  └─────┘  │  │
│ ╰───────────────────────────────╯  │
└─────────────────────────────────────┘
```

### Caractéristiques
- ✨ Bordures arrondies (24px)
- 🎨 Gradient sur l'icône sélectionnée
- 🔴 Badge notification avec gradient rose
- 💫 Animations fluides (300ms)
- 🌈 Bleu pastel pour "Demandes"

---

## 🎴 Cards de Statistiques

### Avant
```
┌──────────────────┐
│ 📦  Demandes     │
│                  │
│ 24               │
│ Ce mois          │
└──────────────────┘
```

### Après
```
┌────────────────────────┐
│ ╭────╮     [+15%]     │ <- Badge avec gradient
│ │ 📦 │                │ <- Icône dans gradient
│ ╰────╯                │
│                       │
│ 24                    │ <- Texte plus grand (32px)
│ Demandes Reçues       │
└────────────────────────┘
   ↑ Gradient subtil + Ombre douce
```

---

## 💳 Request Cards

### Structure Modernisée

```
╔═══════════════════════════════════╗
║ ╭─────────────────────────────╮  ║
║ │ [⏰ En Attente]  [🔥 URGENT] │  ║ <- Header avec gradient
║ │                   Il y a 2h  │  ║
║ ╰─────────────────────────────╯  ║
║                                   ║
║  ╭──╮                            ║
║  │👤│ Patient #12345             ║
║  ╰──╯                            ║
║                                   ║
║  Paracétamol 500mg               ║ <- Nom médicament (18px bold)
║                                   ║
║  ┌──────────────────────┐        ║
║  │ 💊 Quantité: 2 unités│        ║ <- Container vert menthe
║  │ 💊 Dosage: 3x/jour   │        ║
║  └──────────────────────┘        ║
║                                   ║
║  ╭──────────────────────╮        ║
║  │ 💬 "Urgent SVP"      │        ║ <- Note patient (bleu clair)
║  ╰──────────────────────╯        ║
║                                   ║
║  ╔══════════════════════╗        ║
║  ║   ✓ DISPONIBLE       ║        ║ <- Gradient vert/bleu + ombre
║  ╚══════════════════════╝        ║
║                                   ║
║  [❌ Indisponible] [✕ Ignorer]  ║ <- Bordures colorées
║                                   ║
╚═══════════════════════════════════╝
```

---

## 🎭 Header Dashboard

### Transformation

```
AVANT:
┌─────────────────────────────────────┐
│ 🏥 Pharmacie Centrale   [🔔3] [⚙️] │
│ [Silver Partner]                    │
└─────────────────────────────────────┘

APRÈS:
╔═══════════════════════════════════════╗
║  ╱╲╱╲╱╲╱ Gradient Vert/Bleu ╲╱╲╱╲╱  ║
║                                        ║
║  ╭────╮                               ║
║  │ 🏥 │  Pharmacie Centrale           ║
║  ╰────╯  [✨ Silver Partner]          ║
║            ╭────╮                     ║
║            │🔔3 │ <- Badge gradient   ║
║            ╰────╯                     ║
║                                        ║
╚════════════════════════════════════════╝
   ↓ Coins arrondis 30px ↓
```

---

## 🏆 Badge Display

```
╔═════════════════════════════════╗
║     Gradient Blanc → Bleu       ║
║                                 ║
║        ╭──────╮                ║
║        │      │                ║
║        │  🥈  │ <- Gradient or ║
║        │      │                ║
║        ╰──────╯                ║
║                                 ║
║     Silver Partner              ║
║                                 ║
║  ▓▓▓▓▓▓▓▓░░░░░░ 285/500       ║ <- Barre avec ombre
║                                 ║
╚═════════════════════════════════╝
```

---

## 🎨 Palette de Couleurs

### Verts
```
█████ #9FE2BF  Primary Green (Doux)
█████ #B8F3D8  Secondary Green (Lumineux)
█████ #D4F1E8  Mint Green (Très clair)
█████ #4A9B7F  Dark Green (Profond)
```

### Bleus
```
█████ #A7C7E7  Primary Blue (Pastel)
█████ #CCE5FF  Secondary Blue (Aéré)
█████ #6FA8DC  Accent Blue (Prononcé)
█████ #E8F4FF  Light Blue (Très pâle)
```

### Accents
```
█████ #FBD38D  Gold (Badges)
█████ #9AE6B4  Success (Accepté)
█████ #FEB2B2  Error (Refusé)
```

### Neutres
```
█████ #FAFAFA  Background (Off-white)
█████ #FFFFFF  Card Background (Blanc pur)
█████ #F5F7FA  Secondary Background
```

---

## 📐 Dimensions

### Bordures Arrondies
```
20px ────┐           Cards principales
16-18px ─┤           Sections moyennes
14px ────┤           Boutons
12px ────┤           Petits éléments
10px ────┘           Badges/Tags
```

### Ombres
```
Light   (0, 5, 15) blur + rgba(0,0,0,0.03)
Medium  (0, 5, 15) blur + rgba(0,0,0,0.06)
Strong  (0, 8, 20) blur + rgba(0,0,0,0.10)
```

### Espacements
```
Padding Cards:     20-24px (↑ de 16px)
Margin Sections:   24-32px (↑ de 16px)
Gap Éléments:      14-16px (↑ de 8-12px)
```

---

## 🎬 Animations

### Bottom Navbar
```
Sélection → Gradient apparaît en 300ms
           Icône scale 1.0 → 1.05
           Ombre colorée fade in
```

### Cards
```
Hover → Élévation augmente
        Ombre plus prononcée
        Scale 1.0 → 1.02
```

### Boutons
```
Press → Scale 1.0 → 0.98
        Haptic feedback
        Gradient pulse
```

---

## 💡 Tips d'Utilisation

### Pour les Développeurs
```dart
// Gradient standard
Container(
  decoration: BoxDecoration(
    gradient: AppColors.mixedGradient,
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowMedium,
        blurRadius: 15,
        offset: Offset(0, 5),
      ),
    ],
  ),
)

// Icône dans container
Container(
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
    gradient: AppColors.blueGradient,
    borderRadius: BorderRadius.circular(12),
  ),
  child: Icon(
    Icons.icon_rounded,
    color: Colors.white,
  ),
)
```

---

## 📱 Screenshots de Référence

### Screenshot 1 - Health App
- Fond bleu pastel clair
- Cards avec gradients subtils
- Typographie moderne
- Espacement généreux

### Screenshot 2 - Glucose Monitor
- Bottom navbar élégante
- Icônes Material Design
- Gradient sur boutons
- Design aéré et lumineux

---

## ✨ Effets Spéciaux

### Glassmorphism (Léger)
```
background: white @ 70% opacity
backdrop-filter: blur(10px)
border: white @ 30% opacity
```

### Gradient Animation
```
LinearGradient animé sur 2 secondes
Rotation 0° → 360°
Colors cycling
```

### Shimmer Loading
```
Gradient horizontal
Animation left → right
1.5s duration
```

---

## 🎯 Checklist Visuelle

Pour chaque composant:
- [ ] Gradient appliqué ✨
- [ ] Ombres douces 🌫️
- [ ] Coins arrondis 🔵
- [ ] Icônes Material 🎨
- [ ] Animation fluide 💫
- [ ] Couleurs pastel 🌈
- [ ] Espacements généreux 📏
- [ ] Bordures légères 🖼️

---

**Guide créé le:** 8 Février 2026  
**Version UI:** 2.0.0  
**Designer:** AI Assistant pour DiabCare

