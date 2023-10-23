import 'package:beam_web_navigation/src/screen/profile.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import './two_devided_screen/two_devided_screen_exports.dart';

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
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.all(10.0),
              child: Beamer(
                key: _beamerKey,
                routerDelegate: BeamerDelegate(
                  // First Method
                  locationBuilder: RoutesLocationBuilder(
                    routes: {
                      '*': (context, state, data) => const SizedBox(),
                      '/settings': (context, state, data) {
                        debugPrint(info(
                            '### state.pathPatternSegments : ${state.pathPatternSegments}'));
                        if (state.pathPatternSegments.contains('account')) {
                          // nested url
                          return BeamPage(
                            key: ValueKey(
                                'AccountsSettings - ${DateTime.now()}'),
                            type: BeamPageType.slideLeftTransition,
                            child: const AccountSettings(),
                          );
                        } else if (state.pathPatternSegments
                            .contains('profile')) {
                          return BeamPage(
                            key: ValueKey(
                                'Profile Settings - ${DateTime.now()}'),
                            type: BeamPageType.slideLeftTransition,
                            child: const TowDevidedProfile(),
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
                            child: Dashboard(),
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

                  // // Second Method
                  // locationBuilder: ( RouteInformation routeInfo, BeamParameters? data ) {

                  //   if( routeInfo.location.contains('dashboard')) {
                  //     return DashboardLocation( routeInfo );
                  //   }
                  //   if( routeInfo.location.contains('settings')) {
                  //     return SettingsLocation( routeInfo );
                  //   }
                  //   if( routeInfo.location.contains('profile')) {
                  //     return ProfileLocation( routeInfo );
                  //   }
                  //   if( routeInfo.location.contains('notification')) {
                  //     return NotificationLocation( routeInfo );
                  //   }
                  //   if( routeInfo.location.contains('about')) {
                  //     return AboutLocation( routeInfo );
                  //   }

                  //   return NotFound( path: routeInfo.location.toString());

                  // },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DefaultLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => ['/dash*'];

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    return [
      const BeamPage(
        key: ValueKey('Abcdefg'),
        type: BeamPageType.fadeTransition,
        child: Dashboard(),
      ),
    ];
  }
}

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('home-${DateTime.now()}'),
        type: BeamPageType.fadeTransition,
        child: const LandingScreen(),
      ),
    ];
  }
}

class DashboardLocation extends BeamLocation<BeamState> {
  DashboardLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/dashboard'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Dashboard'),
        type: BeamPageType.fadeTransition,
        child: Dashboard(),
      ),
    ];
  }
}

class SettingsLocation extends BeamLocation<BeamState> {
  SettingsLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Settings'),
        type: BeamPageType.fadeTransition,
        child: Settings(),
      ),
    ];
  }
}

class ProfileLocation extends BeamLocation<BeamState> {
  ProfileLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/profile'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('Profile'),
        type: BeamPageType.fadeTransition,
        child: TowDevidedProfile(),
      ),
    ];
  }
}
