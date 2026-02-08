import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors - Pastel Theme (Modern & Professional)
  static const Color primaryGreen = Color(0xFF9FE2BF); // Vert pastel doux
  static const Color secondaryGreen = Color(0xFFB8F3D8); // Vert clair lumineux
  static const Color mintGreen = Color(0xFFD4F1E8); // Menthe très clair
  static const Color darkGreen = Color(0xFF4A9B7F); // Vert profond élégant

  // Accent Colors - Blue Pastel Touch
  static const Color primaryBlue = Color(0xFFA7C7E7); // Bleu pastel principal
  static const Color secondaryBlue = Color(0xFFCCE5FF); // Bleu clair aéré
  static const Color accentBlue = Color(0xFF6FA8DC); // Bleu accent plus prononcé
  static const Color lightBlue = Color(0xFFE8F4FF); // Bleu très pâle

  // Neutral & Background Colors
  static const Color background = Color(0xFFFAFAFA); // Off-white moderne
  static const Color cardBackground = Color(0xFFFFFFFF); // Blanc pur
  static const Color secondaryBackground = Color(0xFFF5F7FA); // Gris très clair
  static const Color border = Color(0xFFE8ECF0); // Bordure subtile

  // Text Colors (plus doux)
  static const Color textPrimary = Color(0xFF2D3748); // Gris anthracite doux
  static const Color textSecondary = Color(0xFF718096); // Gris moyen
  static const Color textMuted = Color(0xFFA0AEC0); // Gris clair
  static const Color textLight = Color(0xFFCBD5E0); // Gris très clair

  // Status Colors (pastel)
  static const Color accentGold = Color(0xFFFBD38D); // Or pastel
  static const Color successGreen = Color(0xFF9AE6B4); // Vert succès pastel
  static const Color warningOrange = Color(0xFFFBD38D); // Orange doux
  static const Color errorRed = Color(0xFFFEB2B2); // Rouge pastel

  // Status Background Colors
  static const Color statusPendingBg = Color(0xFFFFF9E6); // Jaune très pâle
  static const Color statusSuccessBg = Color(0xFFE6F9F0); // Vert très pâle
  static const Color statusErrorBg = Color(0xFFFFF0F0); // Rouge très pâle
  static const Color statusInfoBg = Color(0xFFEBF8FF); // Bleu très pâle

  // Gradient Colors (Modern & Smooth)
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF9FE2BF), Color(0xFFD4F1E8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFFA7C7E7), Color(0xFFE8F4FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premiumGradient = LinearGradient(
    colors: [Color(0xFFFBD38D), Color(0xFFFED7AA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient mixedGradient = LinearGradient(
    colors: [Color(0xFF9FE2BF), Color(0xFFA7C7E7)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow Colors
  static Color shadowLight = const Color(0xFF000000).withOpacity(0.03);
  static Color shadowMedium = const Color(0xFF000000).withOpacity(0.06);
  static Color shadowStrong = const Color(0xFF000000).withOpacity(0.1);
}

