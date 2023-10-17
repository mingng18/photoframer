import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension TypographyUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get poppinsText =>
      GoogleFonts.poppinsTextTheme(theme.textTheme); // Modify this line
  ColorScheme get colors => theme.colorScheme;
  TextStyle? get displayLarge => poppinsText.displayLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get displayMedium => poppinsText.displayMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get displaySmall => poppinsText.displaySmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineLarge => poppinsText.headlineLarge?.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.w600,
      );
  TextStyle? get headlineMedium => poppinsText.headlineMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get headlineSmall => poppinsText.headlineSmall?.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.w900,
      );
  TextStyle? get titleLarge => poppinsText.titleLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get titleMedium => poppinsText.titleMedium?.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.w600,
      );
  TextStyle? get titleSmall => poppinsText.titleSmall?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get labelLarge => poppinsText.labelLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get labelMedium => poppinsText.labelMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get labelSmall => poppinsText.labelSmall?.copyWith(
        color: colors.onSurface,
        fontWeight: FontWeight.bold,
      );
  TextStyle? get bodyLarge => poppinsText.bodyLarge?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodyMedium => poppinsText.bodyMedium?.copyWith(
        color: colors.onSurface,
      );
  TextStyle? get bodySmall => poppinsText.bodySmall?.copyWith(
        color: colors.onSurface,
      );
}
