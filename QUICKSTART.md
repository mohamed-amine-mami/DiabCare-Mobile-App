# 🚀 Quick Start Guide - DiabCare Development

## Welcome Developer! 👋

This guide will help you get started with DiabCare Professional Edition development quickly.

---

## 📋 Prerequisites

Before you begin, ensure you have:

- ✅ Flutter SDK 3.0+ installed
- ✅ Dart 3.0+ installed  
- ✅ Android Studio / VS Code with Flutter extensions
- ✅ Android SDK (for Android development)
- ✅ Xcode (for iOS development, macOS only)

---

## 🎯 First Steps

### 1. Clone & Setup

```bash
cd pim
flutter pub get
```

### 2. Run the App

```bash
# Check available devices
flutter devices

# Run on connected device
flutter run

# Run on specific device
flutter run -d <device-id>

# Run with hot reload enabled (default)
flutter run
```

### 3. Hot Reload Tips

- Press `r` in terminal to hot reload
- Press `R` to hot restart (full restart)
- Press `q` to quit
- Press `p` to show performance overlay

---

## 📁 Project Structure

```
lib/
├── main.dart                      # App entry point
├── theme/
│   ├── app_colors.dart           # Color definitions
│   └── app_theme.dart            # Theme configuration
├── screens/                       # All app screens
│   ├── home_screen.dart          # Main navigation
│   ├── dashboard_screen.dart     # Dashboard/Home
│   ├── patients_list_screen.dart # Patient list
│   ├── patient_details_screen.dart # Patient details
│   ├── appointments_screen.dart   # Appointments
│   ├── notifications_screen.dart  # Notifications
│   ├── doctor_profile_screen.dart # Doctor profile
│   └── medical_reports_screen.dart # Reports
└── widgets/
    └── diabcare_widgets.dart     # Reusable components
```

---

## 🎨 Using the Design System

### Colors

```dart
import '../theme/app_colors.dart';

// Primary colors
AppColors.softGreen
AppColors.lightBlue
AppColors.white
AppColors.background

// Status colors
AppColors.stable
AppColors.attention
AppColors.critical

// Text colors
AppColors.textPrimary
AppColors.textSecondary
AppColors.textLight
```

### Reusable Widgets

```dart
import '../widgets/diabcare_widgets.dart';

// Create a card
DiabCareWidgets.card(
  child: Text('Content'),
  padding: EdgeInsets.all(20),
);

// Status badge
DiabCareWidgets.statusBadge(
  text: 'Stable',
  color: AppColors.stable,
  icon: Icons.check_circle,
);

// Stat card
DiabCareWidgets.statCard(
  title: 'Total Patients',
  value: '248',
  icon: Icons.people,
  color: AppColors.softGreen,
);
```

### Button Styles

```dart
// Primary button
ElevatedButton(
  onPressed: () {},
  style: DiabCareButtons.primary(),
  child: Text('Primary Action'),
);

// Secondary button
OutlinedButton(
  onPressed: () {},
  style: DiabCareButtons.secondary(),
  child: Text('Secondary Action'),
);
```

---

## 🔧 Common Development Tasks

### Adding a New Screen

1. Create file in `lib/screens/`
2. Import theme and widgets:
   ```dart
   import 'package:flutter/material.dart';
   import '../theme/app_colors.dart';
   import '../widgets/diabcare_widgets.dart';
   ```
3. Create StatelessWidget or StatefulWidget
4. Add to navigation in `home_screen.dart` if needed

### Modifying Colors

Edit `lib/theme/app_colors.dart`:
```dart
static const softGreen = Color(0xFF7DDAB9);
```

### Adding Navigation

In `home_screen.dart`:
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => YourNewScreen(),
  ),
);
```

---

## 🐛 Debugging

### View Console Logs

```dart
print('Debug message');
debugPrint('Debug message with better formatting');
```

### Flutter DevTools

```bash
# Open DevTools in browser
flutter pub global activate devtools
flutter pub global run devtools
```

### Check for Errors

```bash
# Analyze code
flutter analyze

# Format code
flutter format lib/
```

---

## 📱 Testing on Devices

### Android Emulator

```bash
# List emulators
emulator -list-avds

# Start emulator
emulator -avd <avd-name>

# Or use Android Studio AVD Manager
```

### iOS Simulator (macOS)

```bash
# Open simulator
open -a Simulator

# Or use Xcode
```

### Physical Device

1. Enable Developer Mode on device
2. Connect via USB
3. Run `flutter devices`
4. Run `flutter run -d <device-id>`

---

## 🏗️ Building for Production

### Android APK

```bash
# Debug build
flutter build apk

# Release build
flutter build apk --release

# Split APKs by ABI (smaller size)
flutter build apk --split-per-abi
```

### iOS App

```bash
# Build for iOS
flutter build ios --release

# Then open in Xcode to archive and upload
open ios/Runner.xcworkspace
```

### Web

```bash
flutter build web --release
```

---

## 💡 Development Tips

### 1. Use Hot Reload Effectively
- Only works for UI changes
- State is preserved
- For logic changes, use hot restart (R)

### 2. Widget Inspector
- Press `i` in terminal to toggle widget inspector
- Or use Flutter DevTools

### 3. Performance
- Use `const` constructors where possible
- Avoid rebuilding entire trees unnecessarily
- Profile with DevTools

### 4. State Management
Currently using StatefulWidget. For larger features, consider:
- Provider
- Riverpod
- Bloc

### 5. Code Organization
- Keep widgets focused and small
- Extract repeated patterns to widgets
- Use the reusable components in `diabcare_widgets.dart`

---

## 🔍 Useful Commands

```bash
# Clean build files
flutter clean

# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade

# Check Flutter setup
flutter doctor -v

# List available devices
flutter devices

# Run with verbose logging
flutter run -v

# Build release APK
flutter build apk --release

# Format all Dart files
flutter format lib/

# Analyze code quality
flutter analyze
```

---

## 📚 Resources

### Official Documentation
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design 3](https://m3.material.io/)

### Tutorials
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
- [Widget Catalog](https://flutter.dev/docs/development/ui/widgets)
- [YouTube - Flutter](https://www.youtube.com/c/flutterdev)

### Tools
- [pub.dev](https://pub.dev/) - Dart packages
- [Flutter DevTools](https://flutter.dev/docs/development/tools/devtools)
- [DartPad](https://dartpad.dev/) - Online Dart editor

---

## 🆘 Common Issues & Solutions

### Issue: "No devices found"
**Solution**: 
- Check USB connection
- Enable Developer Mode on device
- Run `flutter doctor` to diagnose

### Issue: "Build failed"
**Solution**:
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Hot reload not working
**Solution**:
- Use hot restart (R)
- Check for syntax errors
- Restart the app completely

### Issue: Gradle build errors (Android)
**Solution**:
- Check `android/build.gradle` settings
- Update Gradle version if needed
- Clear Android Studio cache

### Issue: Pods errors (iOS)
**Solution**:
```bash
cd ios
pod install
cd ..
flutter run
```

---

## 🎯 Next Steps

1. ✅ Familiarize yourself with the codebase
2. ✅ Review `DESIGN_GUIDE.md` for design standards
3. ✅ Explore each screen in the app
4. ✅ Try modifying colors and see hot reload
5. ✅ Build the app for your target platform
6. ✅ Start implementing new features!

---

## 🤝 Contributing

When adding new features:

1. Follow the existing code style
2. Use the design system colors and components
3. Keep accessibility in mind
4. Test on multiple screen sizes
5. Add comments for complex logic
6. Keep commits focused and descriptive

---

## 📞 Need Help?

- Check the Flutter documentation
- Search Stack Overflow
- Join Flutter Discord/Slack communities
- Review existing code for patterns

---

**Happy Coding! 🎉**

*Last Updated: February 2024*

