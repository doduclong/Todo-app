import 'package:url_launcher/url_launcher_string.dart';
import 'package:validators/validators.dart';


class $MyURLHelp{
  const $MyURLHelp();

  Future<bool> goToApp({
    String? link,
  }) async {
    if (isURL(link)) {
        if (await canLaunchUrlString(link!)) {
          await launchUrlString(link, mode: LaunchMode.externalApplication,);
          return true;
        }
    } return false;
  }

  Future<bool> canLaunchUrl({
    String? link,
  }) async {
    if (isURL(link)) return canLaunchUrlString(link!);
    return false;
  }

}
