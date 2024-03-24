import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pulmopal/firebase/firebase_options.dart';
import 'package:pulmopal/pages/authentication/login_page.dart';
import 'package:pulmopal/pages/blog/blogeWrite/repository/user_control_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      String initialRoute =
          ref.read(userControlerRepositoryProvider).isUserSignedIn();
      return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      );
    });
  }
}
