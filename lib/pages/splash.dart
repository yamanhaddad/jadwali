import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: Column(
              children: [
                const Text('إبدء تنضيم جدول طفلك'),
                IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(Icons.arrow_circle_right_rounded))
              ],
            ),
          )),
    );
  }
}
