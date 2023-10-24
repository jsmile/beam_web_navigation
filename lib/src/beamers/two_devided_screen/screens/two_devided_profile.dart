import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TwoDevidedProfile extends StatelessWidget {
  const TwoDevidedProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          children: [
            Text(
              'Two Devided Screen Profile',
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
