import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final brandColor = const Color(0xFF006971);

  ThemeData light(ColorScheme? lightDynamic) {
    ColorScheme colorScheme = ColorScheme.fromSeed(seedColor: brandColor);
    if (lightDynamic != null) {
      // On Android S+ devices, use the provided dynamic color scheme.
      // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
      colorScheme = lightDynamic.harmonized();
      // (Optional) Customize the scheme as desired. For example, one might
      // want to use a brand color to override the dynamic [ColorScheme.secondary].
      colorScheme = colorScheme.copyWith(secondary: brandColor);
    }
    return ThemeData.light(useMaterial3: true).copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colorScheme,
      appBarTheme: appBarTheme(colorScheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(colorScheme),
      bottomAppBarTheme: bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),
      navigationRailTheme: navigationRailTheme(colorScheme),
      tabBarTheme: tabBarTheme(colorScheme),
      drawerTheme: drawerTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
    );
  }

  ThemeData dark(ColorScheme? darkDynamic) {
    ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: brandColor, brightness: Brightness.dark);
    if (darkDynamic != null) {
      colorScheme = darkDynamic.harmonized();
      colorScheme = colorScheme.copyWith(secondary: brandColor);
    }
    return ThemeData.dark(useMaterial3: true).copyWith(
      pageTransitionsTheme: pageTransitionsTheme,
      colorScheme: colorScheme,
      appBarTheme: appBarTheme(colorScheme),
      cardTheme: cardTheme(),
      listTileTheme: listTileTheme(colorScheme),
      bottomAppBarTheme: bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),
      navigationRailTheme: navigationRailTheme(colorScheme),
      tabBarTheme: tabBarTheme(colorScheme),
      drawerTheme: drawerTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.background,
    );
  }

  final pageTransitionsTheme = const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.linux: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.macOS: NoAnimationPageTransitionsBuilder(),
      TargetPlatform.windows: NoAnimationPageTransitionsBuilder(),
    },
  );

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  final textTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    displayMedium: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    displaySmall: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    headlineLarge: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    headlineMedium: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    headlineSmall: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    titleLarge: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    titleMedium: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    titleSmall: TextStyle(fontFamily: GoogleFonts.montserrat().fontFamily),
    labelLarge: const TextStyle(fontFamily: 'Courier New'),
    labelMedium: const TextStyle(fontFamily: 'Courier New'),
    labelSmall: const TextStyle(fontFamily: 'Courier New'),
    bodyLarge: const TextStyle(fontFamily: 'Courier New'),
    bodyMedium: const TextStyle(fontFamily: 'Courier New'),
    bodySmall: const TextStyle(fontFamily: 'Courier New'),
  );

  CardTheme cardTheme() {
    return CardTheme(
      elevation: 0,
      shape: shapeMedium,
      clipBehavior: Clip.antiAlias,
    );
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      shape: shapeMedium,
      selectedColor: colors.secondary,
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      elevation: 0,
      backgroundColor: colors.surface,
      foregroundColor: colors.onSurface,
    );
  }

  TabBarTheme tabBarTheme(ColorScheme colors) {
    return TabBarTheme(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colors.secondary,
            width: 2,
          ),
        ),
      ),
    );
  }

  BottomAppBarTheme bottomAppBarTheme(ColorScheme colors) {
    return BottomAppBarTheme(
      color: colors.surface,
      elevation: 0,
    );
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colors.surfaceVariant,
      selectedItemColor: colors.onSurface,
      unselectedItemColor: colors.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  NavigationRailThemeData navigationRailTheme(ColorScheme colors) {
    return const NavigationRailThemeData();
  }

  DrawerThemeData drawerTheme(ColorScheme colors) {
    return DrawerThemeData(
      backgroundColor: colors.surface,
    );
  }
}

class NoAnimationPageTransitionsBuilder extends PageTransitionsBuilder {
  const NoAnimationPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
