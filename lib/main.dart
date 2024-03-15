import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/model/locator.dart';
import 'package:keeper/model/navigation_service.dart';
import 'package:keeper/model/routes.dart';
import 'package:keeper/ui/screens/onboarding_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_animate/flutter_animate.dart';

//#FFFF87
//Color(0xffFFFF87)
///Welcome to keeper
void main() {
  setupLocator();
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,],
    // );
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (settings) => generateRoute(settings),
      title: 'Keeper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: OnboardingScreen(),
    );
  }
}
