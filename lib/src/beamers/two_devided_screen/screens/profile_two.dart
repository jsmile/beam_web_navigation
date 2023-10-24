import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTwo extends StatelessWidget {
  const ProfileTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          children: [
            Text(
              'Profile Two',
              style: GoogleFonts.overpass(
                color: Colors.white,
                fontSize: 30.0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
