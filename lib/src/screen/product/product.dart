import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final String title;

  const Product({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24.0),
            ),
            TextButton(
              child: const Text(
                'Go Back to Profile( popToNamed )',
              ),
              onPressed: () {
                // popToNamed() : 특정 경로로 이동하면서, 이전 beamHistory 경로들을 모두 pop
                // 그러나 일반 History 경로는 남아있음.
                Beamer.of(context).popToNamed('/profile');
                // Beamer.of(context).popRoute();

                // print(
                //   Beamer.of(context)
                //     .beamingHistory
                //     .map(
                //       (e) => e.history.map(
                //         (val) => val.routeInformation.location,
                //       ),
                //     )
                //     .toList(),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
