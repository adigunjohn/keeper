import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keeper/model/locator.dart';
import 'package:keeper/model/navigation_service.dart';
import 'package:keeper/ui/screens/home_screen.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const String id = 'OnboardingScreen';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: SvgPicture.asset('assets/svg/svg4.svg'),
                  decoration: BoxDecoration(),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to our note taking app!',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                          ),
                        ),
                        Text(
                          'Easily create, edit, and manage all your notes in one place',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 30),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 7,
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            MaterialButton(
                              minWidth: MediaQuery.sizeOf(context).width * 0.01,
                              // minWidth: 10,
                              // elevation: 4,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              color: Colors.yellow,
                              onPressed: () {
                                locator<NavigationService>().pushNamed(HomeScreen.id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Get started',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 17),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.double_arrow_rounded,
                                        color: Colors.yellow,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18,),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

///Text('Onboarding', style: TextStyle(fontFamily: 'Poppins'),)
