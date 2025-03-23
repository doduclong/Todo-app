import 'package:flutter/material.dart';
import 'package:todo/feature/home/ui/home.dart';
import 'package:todo/routes/routes_name.dart';

import '../feature/setting/ui/setting_ui.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case RoutesName.setting:
        return MaterialPageRoute(builder: (context) => SettingPage(animateTop: true,));
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}