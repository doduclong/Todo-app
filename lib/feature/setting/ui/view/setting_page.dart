import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/language/l10n/l10n.dart';
import 'package:todo/feature/localization/bloc/localization_bloc.dart';
import 'package:todo/feature/setting/ui/utils/change_language_bottom_sheet.dart';
import 'package:ui_core/artist/artist.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.animateTop});
  final bool animateTop;
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  Widget animateChanger(
      {required bool animateTop, required Widget child, required int delay}) {
    if (animateTop) {
      return FadeInUp(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    } else {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.white,

      /// AppBar
      appBar: _buildAppBar(context),

      /// Body
      body: _buildBody(l10n, context),
    );
  }

  /// Body
  Widget _buildBody(AppLocalizations l10n, BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          animateChanger(
            delay: 800,
            animateTop: widget.animateTop,
            child: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.language,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 100,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: OutlinedButton(
                        onPressed: () =>
                            AppUtils.showLanguageBottomSheet(context),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(8.0),
                          foregroundColor: MyArtist.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: BlocBuilder<LocalizationBloc,
                                  AppLocalizationState>(
                                builder: (context, state) {
                                  return state.selectedLanguage.image.image();
                                },
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: MyArtist.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  /// AppBar
  AppBar _buildAppBar(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      centerTitle: true,
      title: animateChanger(
        delay: 300,
        child: Text(l10n.settings),
        animateTop: !widget.animateTop,
      ),
    );
  }
}
