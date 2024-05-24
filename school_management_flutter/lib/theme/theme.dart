import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/app_colors.dart';
import '../extension/theme_extension.dart';

class AppTheme {
  bool isDarkTheme;
  BuildContext context;
  // Private constructor
  AppTheme({this.isDarkTheme = false, required this.context});

  ThemeData get getTheme => getAppTheme();

  ThemeData getAppTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      fontFamily: 'SF Pro Display',
      focusColor: AppColors.primary,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green, // Change this color to your desired color
      ),
      extensions: const <ThemeExtension<AppColorExtension>>[
        // AppColorExtension(
        //   color1: isDarkTheme ? AppColors.light : AppColors.dark,
        //   color2:
        //       isDarkTheme ? AppColors.boxColorInDarkMode : AppColors.light50,
        //   color3: isDarkTheme ? Colors.yellow : Colors.red,
        // ),
      ],
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.scaffoldBackgroundColor
          : AppColors.scaffoldBackgroundColor,
      canvasColor: isDarkTheme ? AppColors.canvasColor : AppColors.canvasColor,
      textTheme: Theme.of(context).textTheme.copyWith(
            //Display text is our primary text where color will not change in any mode if we want will use copy constructor & even fpr font family
            displaySmall: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            displayMedium: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            displayLarge: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            titleLarge: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            titleMedium: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
            ),
            titleSmall: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            bodyLarge: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            bodyMedium: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
            ),
            bodySmall: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),

            labelLarge: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
            labelMedium: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    color: AppColors.drawerTextColor,
                  ),
            ),
            labelSmall: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 18,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),

            ///Display text is our primary text where color will not change in any mode if we want will use copy constructor & even fpr font family
          ),
      // .apply(
      //   bodyColor: isDarkTheme ? Colors.white : Colors.black,
      //   displayColor: Colors.grey,
      // ),

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.36),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white.withOpacity(0.36),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: convertColorToMaterialStateProperty(AppColors.primary),
        overlayColor: convertColorToMaterialStateProperty(AppColors.primary),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
            isDarkTheme ? Colors.orange : Colors.purple),
      ),
      listTileTheme: ListTileThemeData(
        iconColor:
            isDarkTheme ? const Color(0xff838383) : const Color(0xff838383),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: isDarkTheme ? Colors.black : Colors.white,
          iconTheme: IconThemeData(
              color: isDarkTheme ? Colors.white : Colors.black54)),
      // bottomNavigationBarTheme:
      //     Theme.of(context).bottomNavigationBarTheme.copyWith(
      //           backgroundColor: AppColors.light,
      //           unselectedIconTheme:
      //               IconThemeData(size: 24.h, color: AppColors.dark100),
      //           selectedIconTheme:
      //               IconThemeData(size: 24.h, color: AppColors.primary),
      //           selectedLabelStyle: TextStyle(
      //             color: AppColors.primary,
      //             fontSize: 12.sp,
      //             fontFamily: 'Poppins',
      //             fontWeight: FontWeight.w500,
      //             height: 1.33,
      //           ),
      //           unselectedLabelStyle: TextStyle(
      //             color: AppColors.dark150,
      //             fontSize: 12.sp,
      //             fontFamily: 'Poppins',
      //             fontWeight: FontWeight.w500,
      //             height: 1.33,
      //           ),
      //         ),
    );
  }
}

WidgetStateProperty<Color?> convertColorToMaterialStateProperty(
    Color baseColor) {
  return WidgetStateProperty.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      // Color when the widget is pressed
      return baseColor.withOpacity(0.8);
    } else if (states.contains(WidgetState.disabled)) {
      // Color when the widget is disabled
      return baseColor.withOpacity(0.4);
    } else {
      // Default color for normal state
      return baseColor;
    }
  });
}
