

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwali_test_1/pages/home_parent.dart';
import 'package:jadwali_test_1/pages/login_parent.dart';

class PreLogin extends StatefulWidget {
  static const String routeName = '/pre_login';
  const PreLogin({super.key});

  @override
  State<PreLogin> createState() => _PreLoginState();
}

class _PreLoginState extends State<PreLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // Replace 'your_image.png' with your image asset path
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // GoRouter.of(context).go(LoginParent.routeName);
                  context.go('/pre_login/login_parent');
                  //context.goNamed(LoginParent.routeName);
                  // Action for the first button
                },
                child: const Text('ولي الأمر'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Action for the second button
                },
                child: const Text('الطفل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
