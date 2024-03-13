
import 'package:flutter/material.dart';

class UIGlobalVariables {
  ///******Format******
  ///appText + Renk + Kalınlık(Bold-Regular) + Büyüklük(14->Small - 16->Medium - 18->Large) + Style

  //** FONTSİZE - 30 **//

static TextStyle appTextBlackBoldVeryLargeStyle =
      const TextStyle(color: Colors.black).bold.size(30);
      
  //** FONTSİZE - 18 **//

  static TextStyle appTextBlackBoldLargeStyle =
      const TextStyle(color: Colors.black).bold.size(18);

  static TextStyle appTextWhiteBoldLargeStyle =
      const TextStyle(color: Colors.white).bold.size(18);

  static TextStyle appTextGreyBoldLargeStyle =
      const TextStyle(color: Colors.grey).bold.size(18);

  static TextStyle appTextBlueBoldLargeStyle =
      const TextStyle(color: Color(0xff3B29F1)).bold.size(18);

  static TextStyle appTextBlackRegularLargeStyle =
      const TextStyle(color: Colors.black).regular.size(18);

  //** FONTSİZE - 16 **//

  static TextStyle appTextBlackBoldMediumStyle =
      const TextStyle(color: Colors.black).bold.size(16);

  static TextStyle appTextGrayBoldMediumStyle =
      const TextStyle(color: Color(0xffb2b2b2)).bold.size(16);

  static TextStyle appTextWhiteBoldMediumStyle =
      const TextStyle(color: Colors.white).bold.size(16);

  static TextStyle appTextBlueBoldMediumStyle =
      const TextStyle(color: Color(0xff3B29F1)).bold.size(16);

  static TextStyle appTextBlackUnderlineBoldMediumStyle =
      const TextStyle(color: Colors.black, decoration: TextDecoration.underline)
          .bold
          .size(16);

  static TextStyle appTextWhiteUnderlineBoldMediumStyle =
      const TextStyle(color: Colors.white, decoration: TextDecoration.underline)
          .bold
          .size(16);

  static TextStyle appTextBlackRegularMediumStyle =
      const TextStyle(color: Colors.black, decoration: TextDecoration.none)
          .regular
          .size(16);

  static TextStyle appTextWhiteRegularMediumStyle =
      const TextStyle(color: Colors.white, decoration: TextDecoration.none)
          .regular
          .size(
            16,
          );

  static TextStyle appTextBlueRegularMediumStyle =
      const TextStyle(color: Color(0xff3B29F1)).regular.size(16);

  //** FONTSİZE - 14 **//

  static TextStyle appTextBlueBoldSmallStyle =
      const TextStyle(color: Color(0xff3B29F1)).bold.size(14);

  static TextStyle appTextBlackBoldSmallStyle = const TextStyle().bold.size(14);

  static TextStyle appTextBlackRegularSmallStyle =
      const TextStyle(color: Colors.black).regular.size(14);

  static TextStyle appTextWhiteRegularSmallStyle =
      const TextStyle(color: Colors.white).regular.size(14);

  static TextStyle appTextRedRegularSmallStyle =
      const TextStyle(color: Colors.red).regular.size(14);

  static TextStyle appTextGrayRegularSmallStyle =
      const TextStyle(color: Color(0xffb2b2b2)).regular.size(14);

  static TextStyle appTextBlueRegularSmallStyle =
      const TextStyle(color: Color(0xff3B29F1)).regular.size(14);

  //** FONTSİZE - 12  **//

  static TextStyle appTextWhiteRegularVerySmallStyle =
      const TextStyle(color: Colors.white).regular.size(12);

  static TextStyle appTextBlueBoldVerySmallStyle =
      const TextStyle(color: Color(0xff3B29F1)).bold.size(12);

  static TextStyle appTextBlueRegularVerySmallStyle =
      const TextStyle(color: Color(0xff3B29F1)).regular.size(12);

  static TextStyle appTextRedRegularVerySmallStyle =
      const TextStyle(color: Colors.red).regular.size(12);
}



extension TextStyleExt on TextStyle {

  TextStyle get black => copyWith(fontWeight: FontWeight.w900);
  TextStyle get heavy => copyWith(fontWeight: FontWeight.w900);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get ultraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get demiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get ultraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get hairLine => copyWith(fontWeight: FontWeight.w100);
  TextStyle size(double size) => copyWith(fontSize: size);
}

class TextStyleExtx extends TextStyle {}
