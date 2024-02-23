import 'package:flutter/material.dart';
import 'package:keeper/ui/screens/createnote_screen.dart';
import 'package:keeper/ui/screens/home_screen.dart';
import 'package:keeper/ui/screens/onboarding_screen.dart';

///locator<NavigationService>().pushNamed(OTPScreen.id);

Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.id:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case OnboardingScreen.id:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      );case CreateNoteScreen.id:
      return MaterialPageRoute(
        builder: (_) => CreateNoteScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Unknown Page')),
        ),
      );
  }
}
