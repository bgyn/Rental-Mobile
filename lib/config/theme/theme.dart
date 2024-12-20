import 'package:flutter/material.dart';
import 'package:rentpal/config/theme/color_palette.dart';
import 'package:rentpal/core/extension/extension.dart';

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      fontFamily: "Geologica",
      scaffoldBackgroundColor: Colors.white,
      extensions: const <ThemeExtension<AppColors>>[
        AppColors(
          primaryColor: ColorPalette.primaryColor,
          secondaryColor: ColorPalette.secondaryColor,
        )
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 0.018.toRes(context),
          color: Colors.white,
        ),
      ),
      primaryColor: ColorPalette.primaryColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontWeight: FontWeight.w300),
      ));
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color? primaryColor;
  final Color? secondaryColor;
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
    );
  }
}
