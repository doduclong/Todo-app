
import 'package:helper_package/src.dart';
import 'package:intl/intl.dart';

class MyPackageInterpreter {
  MyPackageInterpreter._();

  /*
  Hàm setup locale cho toàn bộ ứng dụng và package,
   luôn chạy hàm này khi thay đổi ngôn ngữ
   */
  static void setupDefaultLocale(String locale){
    Intl.defaultLocale = locale;
    return;
  }

  static String get defaultLocale => Intl.defaultLocale ?? 'en';

  static const _localizedValues = <String, Map<String, String>>  {
    'en': enUS,
    'vi': vi,
    'ja': ja,
    'ko': ko,
  };

  static String _translate(String key,){
    try {
      return _localizedValues[
        _localizedValues.containsKey(defaultLocale)
            ? defaultLocale
            : _localizedValues.keys.first]![key]!;
    } catch (e) {
      return key;
    }
  }

  static String get clean => _translate('clean');
  static String get reset => _translate('reset');
  static String get to => _translate('to');
  static String get month => _translate('month');
  static String get twoWeeks => _translate('twoWeeks');
  static String get week => _translate('week');
  static String get confirm => _translate('confirm');
  static String get noDateTimeRange => _translate('noDateTimeRange');
  static String get selectDateTimeRange => _translate('selectDateTimeRange');
  static String get noDateTime => _translate('noDateTime');
  static String get selectDateTime => _translate('selectDateTime');
  static String get malformed => _translate('malformed');
  static String get periodOfAbout150Years => _translate('periodOfAbout150Years');
  static String get oneMoreTimeToExit => _translate('oneMoreTimeToExit');
  static String get letsSelect => _translate('letsSelect');
  static String get unSelectAll => _translate('unSelectAll');
  static String get selectAll => _translate('selectAll');
  static String get search => _translate('search');
  static String get selectWhatYouWant => _translate('selectWhatYouWant');
  static String get connectToServerFailure => _translate('connectToServerFailure');
  static String get connectToServerFailureDetail => _translate('connectToServerFailureDetail');
  static String get done => _translate('done');
  static String get canNotConnectToServer => _translate('canNotConnectToServer');
  static String get loadMore => _translate('loadMore');
  static String get loadingMore => _translate('loadingMore');

}
