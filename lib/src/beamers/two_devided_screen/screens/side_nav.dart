import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../two_devided_screen_exports.dart';

class SideNav extends StatefulWidget {
  final GlobalKey<BeamerState> beamer;

  const SideNav({
    Key? key,
    required this.beamer,
  }) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  int selected = -1;

  List<String> navItems = [
    'Dashboard',
    'Settings',
    'Profile',
    'Notifications',
    'About',
  ];

  List<String> navs = [
    '/dashboard',
    '/settings',
    '/profile',
    '/notifications',
    '/about',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final path = (context.currentBeamLocation.state as BeamState).uri.path;
    debugPrint(info('### path: $path'));

    if (path.contains('/dashboard')) {
      selected = 0;
    } else if (path.contains('/settings')) {
      selected = 1;
    } else if (path.contains('/profile')) {
      selected = 2;
    } else if (path.contains('/notifications')) {
      selected = 3;
    } else if (path.contains('/about')) {
      selected = 4;
    }

    return Container(
      color: Colors.grey[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: navItems.map(
          (navItem) {
            return AnimatedContainer(
              key: ValueKey(navItem),
              decoration: BoxDecoration(
                color: selected == navItems.indexOf(navItem)
                    ? Colors.grey[850]
                    : Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              duration: const Duration(milliseconds: 375),
              width: 120.0,
              child: Material(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.beamer.currentState?.routerDelegate
                          .beamToNamed(navs[navItems.indexOf(navItem)]);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      navItem,
                      style: TextStyle(
                        color: selected == navItems.indexOf(navItem)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
