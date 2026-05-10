import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff24389c),
      surfaceTint: Color(0xff4355b9),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3f51b5),
      onPrimaryContainer: Color(0xffcacfff),
      secondary: Color(0xff964900),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff57c00),
      onSecondaryContainer: Color(0xff572800),
      tertiary: Color(0xff8f2ba1),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffab47bc),
      onTertiaryContainer: Color(0xfffff6fa),
      error: Color(0xffb81311),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffdc3128),
      onErrorContainer: Color(0xfffffbff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1a1b22),
      onSurfaceVariant: Color(0xff454652),
      outline: Color(0xff757684),
      outlineVariant: Color(0xffc5c5d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3037),
      inversePrimary: Color(0xffbac3ff),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff00105c),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff293ca0),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff311300),
      secondaryFixedDim: Color(0xffffb786),
      onSecondaryFixedVariant: Color(0xff723600),
      tertiaryFixed: Color(0xffffd6ff),
      onTertiaryFixed: Color(0xff350040),
      tertiaryFixedDim: Color(0xfff8acff),
      onTertiaryFixedVariant: Color(0xff780e8c),
      surfaceDim: Color(0xffdbd9e2),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f2fc),
      surfaceContainer: Color(0xffefedf6),
      surfaceContainerHigh: Color(0xffe9e7f0),
      surfaceContainerHighest: Color(0xffe3e1ea),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff13298f),
      surfaceTint: Color(0xff4355b9),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3f51b5),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff592900),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffac5500),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff600071),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa542b6),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740003),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffd12921),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff101117),
      onSurfaceVariant: Color(0xff343541),
      outline: Color(0xff51525e),
      outlineVariant: Color(0xff6b6c7a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3037),
      inversePrimary: Color(0xffbac3ff),
      primaryFixed: Color(0xff5364c9),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff394baf),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffac5500),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff874200),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa542b6),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff89259c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc7c5ce),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f2fc),
      surfaceContainer: Color(0xffe9e7f0),
      surfaceContainerHigh: Color(0xffdddce5),
      surfaceContainerHighest: Color(0xffd2d0d9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff001b86),
      surfaceTint: Color(0xff4355b9),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2c3fa3),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4a2100),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff753800),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff50005f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7b138f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff610002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff980006),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2a2b37),
      outlineVariant: Color(0xff474855),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2f3037),
      inversePrimary: Color(0xffbac3ff),
      primaryFixed: Color(0xff2c3fa3),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0d248c),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff753800),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff532600),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7b138f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5a006b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb9b8c0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2eff9),
      surfaceContainer: Color(0xffe3e1ea),
      surfaceContainerHigh: Color(0xffd5d3dc),
      surfaceContainerHighest: Color(0xffc7c5ce),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbac3ff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff08218a),
      primaryContainer: Color(0xff3f51b5),
      onPrimaryContainer: Color(0xffcacfff),
      secondary: Color(0xffffb786),
      onSecondary: Color(0xff502400),
      secondaryContainer: Color(0xfff57c00),
      onSecondaryContainer: Color(0xff572800),
      tertiary: Color(0xfff8acff),
      onTertiary: Color(0xff570067),
      tertiaryContainer: Color(0xffab47bc),
      onTertiaryContainer: Color(0xfffff6fa),
      error: Color(0xffffb4a9),
      onError: Color(0xff690002),
      errorContainer: Color(0xffff5545),
      onErrorContainer: Color(0xff450001),
      surface: Color(0xff121319),
      onSurface: Color(0xffe3e1ea),
      onSurfaceVariant: Color(0xffc5c5d4),
      outline: Color(0xff8f909e),
      outlineVariant: Color(0xff454652),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1ea),
      inversePrimary: Color(0xff4355b9),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff00105c),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff293ca0),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff311300),
      secondaryFixedDim: Color(0xffffb786),
      onSecondaryFixedVariant: Color(0xff723600),
      tertiaryFixed: Color(0xffffd6ff),
      onTertiaryFixed: Color(0xff350040),
      tertiaryFixedDim: Color(0xfff8acff),
      onTertiaryFixedVariant: Color(0xff780e8c),
      surfaceDim: Color(0xff121319),
      surfaceBright: Color(0xff383940),
      surfaceContainerLowest: Color(0xff0d0e14),
      surfaceContainerLow: Color(0xff1a1b22),
      surfaceContainer: Color(0xff1f1f26),
      surfaceContainerHigh: Color(0xff292930),
      surfaceContainerHighest: Color(0xff34343b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd6daff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff001775),
      primaryContainer: Color(0xff7789f0),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffd4b9),
      onSecondary: Color(0xff401c00),
      secondaryContainer: Color(0xfff57c00),
      onSecondaryContainer: Color(0xff1f0a00),
      tertiary: Color(0xfffeccff),
      onTertiary: Color(0xff450052),
      tertiaryContainer: Color(0xffce67de),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540002),
      errorContainer: Color(0xffff5545),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121319),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdbdbeb),
      outline: Color(0xffb1b1c0),
      outlineVariant: Color(0xff8f8f9d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1ea),
      inversePrimary: Color(0xff2a3da1),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff000841),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff13298f),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff210b00),
      secondaryFixedDim: Color(0xffffb786),
      onSecondaryFixedVariant: Color(0xff592900),
      tertiaryFixed: Color(0xffffd6ff),
      onTertiaryFixed: Color(0xff24002c),
      tertiaryFixedDim: Color(0xfff8acff),
      onTertiaryFixedVariant: Color(0xff600071),
      surfaceDim: Color(0xff121319),
      surfaceBright: Color(0xff44444b),
      surfaceContainerLowest: Color(0xff06070d),
      surfaceContainerLow: Color(0xff1d1d24),
      surfaceContainer: Color(0xff27272e),
      surfaceContainerHigh: Color(0xff323239),
      surfaceContainerHighest: Color(0xff3d3d44),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffefeeff),
      surfaceTint: Color(0xffbac3ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb5bfff),
      onPrimaryContainer: Color(0xff000532),
      secondary: Color(0xffffece2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffb17c),
      onSecondaryContainer: Color(0xff180700),
      tertiary: Color(0xffffeafc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff7a6ff),
      onTertiaryContainer: Color(0xff1b0021),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea3),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff121319),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffefeefe),
      outlineVariant: Color(0xffc1c1d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e1ea),
      inversePrimary: Color(0xff2a3da1),
      primaryFixed: Color(0xffdee0ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbac3ff),
      onPrimaryFixedVariant: Color(0xff000841),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb786),
      onSecondaryFixedVariant: Color(0xff210b00),
      tertiaryFixed: Color(0xffffd6ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff8acff),
      onTertiaryFixedVariant: Color(0xff24002c),
      surfaceDim: Color(0xff121319),
      surfaceBright: Color(0xff4f4f57),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f1f26),
      surfaceContainer: Color(0xff2f3037),
      surfaceContainerHigh: Color(0xff3b3b42),
      surfaceContainerHighest: Color(0xff46464d),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
