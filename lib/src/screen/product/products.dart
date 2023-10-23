import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
          children: [
            const Text(
              'Products',
              style: TextStyle(fontSize: 24.0),
            ),
            TextButton(
              child: const Text('Product 1'),
              onPressed: () {
                Beamer.of(context).beamToNamed('/products/product1');
                // print(
                //  Beamer.of(context)
                //    .beamingHistory
                //    .map(
                //      ( e ) => e.historyMap(
                //        (val) => val.routeInformation.location
                //      )
                //    )
                //    .toList(),
                // );
              },
            ),
            TextButton(
              child: const Text('Product 2'),
              onPressed: () {
                Beamer.of(context).beamToNamed('/products/product2');
                // print(
                //  Beamer.of(context)
                //    .beamingHistory
                //    .map(
                //      ( e ) => e.historyMap(
                //        (val) => val.routeInformation.location
                //      )
                //    )
                //    .toList(),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
