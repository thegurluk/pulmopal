import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulmopal/config/router/route_name.dart';

final userControlerRepositoryProvider =
    Provider((ref) => UserControlRepository(auth: FirebaseAuth.instance));

class UserControlRepository {
  final FirebaseAuth auth;
  UserControlRepository({
    required this.auth,
  });

  String isUserSignedIn() {
    final user = auth.currentUser;
    if (user != null) {
      return AppRouteNames.home;
    } else {
      return AppRouteNames.login;
    }
  }
}
