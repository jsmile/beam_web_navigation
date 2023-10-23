import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 24.0),
            ),
            TextButton(
              child: const Text('Go Back'),
              onPressed: () {
                // beamerBack() : 강제로 이전으로 돌아가기, Navi 경로에 추가됨
                // Home --> Profile : beamBack() --> Home
                // 따라서 다시 history back 하면,
                // Home --> Profile --> Home
                Beamer.of(context).beamBack();
                // print(
                //  Beamer.of(context)
                //    .beamingHistory
                //    .map(
                //      ( e ) => e.history[ 0 ].routeInformation.location
                //    )
                //    .toList(),
                // );
                //
                // context.beamBack();
              },
            ),
          ],
        ),
      ),
    );
  }
}
