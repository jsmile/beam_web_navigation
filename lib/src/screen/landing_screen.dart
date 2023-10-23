import 'package:beam_web_navigation/src/screen/profile.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import 'two_devided_screen/account_settings.dart';
import 'two_devided_screen/profile_settings.dart';
import 'two_devided_screen/settings.dart';
import 'two_devided_screen/side_nav.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SideNav(beamer: _beamerKey),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Beamer(
            key: _beamerKey,
            routerDelegate: BeamerDelegate(
              locationBuilder: RoutesLocationBuilder(
                routes: {
                  '*': (context, state, data) => const SizedBox(),
                  '/settings': (context, state, data) {
                    print(state.pathPatternSegments);
                    if (state.pathPatternSegments.contains('account')) {
                      return BeamPage(
                        key: ValueKey('AccountsSettings - ${DateTime.now()}'),
                        type: BeamPageType.slideLeftTransition,
                        child: const AccountSettings(),
                      );
                    } else if (state.pathPatternSegments.contains('profile')) {
                      return BeamPage(
                        key: ValueKey('Profile Settings - ${DateTime.now()}'),
                        type: BeamPageType.slideLeftTransition,
                        child: const ProfileSettings(),
                      );
                    }

                    return BeamPage(
                      key: ValueKey('Settings - ${DateTime.now()}'),
                      type: BeamPageType.scaleTransition,
                      child: const Settings(),
                    );
                  },
                  '/dashboard': (context, state, data) => const BeamPage(
                        key: ValueKey('DashBoard'),
                        type: BeamPageType.scaleTransition,
                        child: DashBoard(),
                      ),
                  '/profile': (context, state, data) => const BeamPage(
                        key: ValueKey('Profile'),
                        type: BeamPageType.scaleTransition,
                        child: Profile(),
                      ),
                  'notification': (context, state, data) => const BeamPage(
                        key: ValueKey('Notification'),
                        type: BeamPageType.scaleTransition,
                        child: Notifications(),
                      ),
                  '/about': (context, state, data) => const BeamPage(
                        key: ValueKey('About'),
                        type: BeamPageType.scaleTransition,
                        child: About(),
                      ),
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
