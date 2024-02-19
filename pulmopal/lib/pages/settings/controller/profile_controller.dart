// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/settings/repository/profile_repository.dart';

final ProfileControllerProvider = Provider((ref) => ProfileController(
      profileRepository: ref.read(ProfileRepositoryProvider),
    ));

class ProfileController {
  final ProfileRepository profileRepository;
  ProfileController({
    required this.profileRepository,
  });

  Future<UserModel> getUser() async {
    return await profileRepository.getUser();
  }
}
