import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:jadwali_test_1/auth/auth_service.dart';
import 'package:jadwali_test_1/pages/home_parent.dart';
import 'package:jadwali_test_1/pages/login_parent.dart';
import 'package:jadwali_test_1/pages/pre_login.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
//}

final _router = GoRouter(
  
  initialLocation: PreLogin.routeName,
  debugLogDiagnostics: true,//show routes in consol

  // redirect: (context, state) {
  //   //check current user, or if a user is logged in
  //   if (AuthService.currentUser == null) {
  //     //return LoginParent.routeName;
  //     return PreLogin.routeName;
  //   }
  //   return null; // it will not redirect to login page and go streight to homepage
  // },
  redirect:(context, state) {
    if (AuthService.currentUser != null){
      return HomeParent.routeName;
    }return null;
  },
  routes: [
    GoRoute(
      name: HomeParent.routeName,
      path:  HomeParent.routeName,
      builder: (context, state) => const HomeParent(),
    ),
    GoRoute(
        name: PreLogin.routeName,
        path: PreLogin.routeName,
        builder: (context, state) => const PreLogin(),
        routes: [
          GoRoute(
            name: LoginParent.routeName,
            path: LoginParent.routeName,
            builder: (context, state) => const LoginParent(),
          ),
        ]
        ),
        // GoRoute(
        //     name: LoginParent.routeName,
        //     path: LoginParent.routeName,
        //     builder: (context, state) => const LoginParent(),
        //   )
  ],
  
);
}