import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                // _beamKey.currentState?.routerDelegate.beamToNamed('/settings/profile');
                context.beamToNamed('/settings/profile');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Profile Settings',
                  style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                // _beamKey.currentState?.routerDelegate.beamToNamed('/settings/account');
                context.beamToNamed('/settings/account');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Account Settings',
                  style: GoogleFonts.overpass(
                    color: Colors.white,
                    fontSize: 30.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
