import 'package:flutter/material.dart';
import 'package:ui_core/src.dart';


class $MyTextStyle {
  const $MyTextStyle();

   static const _baseTextStyle = TextStyle(
    fontFamily: MyFontFamily.notoSansJapanese,
    fontFamilyFallback: [
      MyFontFamily.notoSansKorean,
      MyFontFamily.notoSansSimplifiedChinese,
    ],
    package: 'ui_core', // Thêm thư viện front chữ từ package
    height: 1.5,
     leadingDistribution:  TextLeadingDistribution.even,
  );

   // Dành cho Hero
  TextStyle myTextStyleForHero({required TextStyle textStyle, required BuildContext context}){
    if(Theme.of(context).textTheme.titleSmall == null) return textStyle;
    return Theme.of(context).textTheme.titleSmall!.merge(textStyle);
  }

  TextStyle get logoBold36 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );

   TextStyle get titleH1Bold26 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );

  TextStyle get titleH2Bold24 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  TextStyle get titleH2SemiBold24 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

   TextStyle get titleH4Bold20 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

   TextStyle get textSubtitleRegular18 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  TextStyle get textLargeBold16 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

   TextStyle get textLargeSemiBold16 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

   TextStyle get textLargeMedium16 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

   TextStyle get textLargeRegular16 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

   TextStyle get mediumTextBold14 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

   TextStyle get mediumTextSemiBold14 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

   TextStyle get mediumTextMedium14 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  TextStyle get mediumTextMedium12 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

   TextStyle get mediumTextRegular14 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  TextStyle get smallTextSemiBold12 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

   TextStyle get smallTextMedium12 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

   TextStyle get  smallTextRegular12 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  TextStyle get  smallTextRegular10 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

   TextStyle get captionBold10 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  TextStyle get captionSemiBold10 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

   TextStyle get captionRegular10 => _baseTextStyle.copyWith(
    color: MyArtist.onBackground,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );


}
