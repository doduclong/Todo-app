import 'dart:ui';

import 'package:todo/core/language/gen/assets.gen.dart';

//open terminal and typing flutter gen-l10n
enum Language {
  english(
    Locale('en', 'US'),
    Assets.english,
    'English',
  ),
  vietnam(
    Locale('vi', 'VI'),
    Assets.vietnam,
    'Vietnam',
  );

  const Language(this.value, this.image, this.text);

  final Locale value;
  final AssetGenImage image;
  final String text;
}