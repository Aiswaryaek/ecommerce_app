import 'package:ecommerce_app/styles/colors.dart';
import 'package:flutter/material.dart';

const _secondaryFont = 'Montserrat-SemiBold';

const _tertiaryFont = 'Montserrat-ExtraBold';


TextStyle buttonTextStyle = const TextStyle(
  fontFamily: _tertiaryFont,
  color: whiteColor,
  fontSize: 11,
);

TextStyle unSelectedTextStyle = const TextStyle(
  fontFamily: _tertiaryFont,
  color: unselectedTextColor,
  fontSize: 11,
);

TextStyle titleTextStyle = const TextStyle(
  fontFamily: _secondaryFont,
  color: blackColor,
  fontSize: 13,
);

TextStyle subTitleTextStyle = const TextStyle(
  fontFamily: _tertiaryFont,
  color: buttonColor,
  fontSize: 15,
);
