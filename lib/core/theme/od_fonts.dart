import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'od_colors.dart';

abstract class MayaTextStyles {
  static final libreCaslonDisplay = TextStyle(
    fontFamily: GoogleFonts.libreCaslonDisplay().fontFamily,
    color: MayaColors.primary,
    fontWeight: FontWeight.w600,
    fontSize: 45,
  );
  static final poppinsLarge = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  static final poppinsMedium = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );
  static final poppinsSmall = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    color: MayaColors.foreground,
    fontSize: 20,
  );
  static final jetBrainsMonoLarge = TextStyle(
    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.bold,
    fontSize: 110,
  );
  static final jetBrainsMonoMedium = TextStyle(
    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.w600,
    fontSize: 80,
  );
  static final jetBrainsMonoSmall = TextStyle(
    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
    color: MayaColors.foreground,
    fontSize: 40,
  );
  static final jetBrainsMonoExtraSmall = TextStyle(
    fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.w300,
    fontSize: 25,
  );
  static final interLarge = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  static final interMedium = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );
  static final interSmall = TextStyle(
    fontFamily: GoogleFonts.inter().fontFamily,
    color: MayaColors.foreground,
    fontSize: 20,
  );
  static final bebasNeueLarge = TextStyle(
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
    color: MayaColors.foreground,
    fontSize: 40,
  );
  static final bebasNeueMedium = TextStyle(
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
    color: MayaColors.foreground,
    fontSize: 30,
  );
  static final bebasNeueSmall = TextStyle(
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
    color: MayaColors.foreground,
    fontSize: 20,
  );
  static final jostLarge = TextStyle(
    fontFamily: GoogleFonts.jost().fontFamily,
    color: MayaColors.foreground,
    fontWeight: FontWeight.bold,
    fontSize: 40,
  );
  static final jostMedium = TextStyle(
    fontFamily: GoogleFonts.jost().fontFamily,
    color: MayaColors.background,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );
  static final jostSmall = TextStyle(
    fontFamily: GoogleFonts.jost().fontFamily,
    color: MayaColors.background,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );

  static final arimoSmall = TextStyle(
    fontFamily: GoogleFonts.arimo().fontFamily,
    color: MayaColors.background,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
}
