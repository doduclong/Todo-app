// import 'package:flutter/material.dart';
// import 'package:todo/routes/route.dart';
//
// import 'feature/home/ui/home.dart';
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   //final ShoppingRepository shoppingRepository;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: const HomePage(),
//       initialRoute: RoutesName.home,
//       onGenerateRoute: Routes.generateRoute,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/language/l10n/l10n.dart';
import 'package:todo/feature/localization/bloc/localization_bloc.dart';
import 'package:todo/routes/route.dart';

import 'feature/home/ui/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc()..add(GetLanguage()),
      child: BlocBuilder<LocalizationBloc, AppLocalizationState>(
        buildWhen: (previous, current) =>
            previous.selectedLanguage != current.selectedLanguage,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state.selectedLanguage.value,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: const HomePage(),
            initialRoute: RoutesName.home,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
