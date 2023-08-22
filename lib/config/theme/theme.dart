import 'package:bookly/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: kPrimaryColor,
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}
