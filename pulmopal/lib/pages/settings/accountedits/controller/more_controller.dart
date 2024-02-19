// ignore_for_file: non_constant_identifier_names

import 'package:pulmopal/models/article_model.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/settings/accountedits/repository/more_repository.dart';
import 'package:riverpod/riverpod.dart';

final MoreControllerProvider = Provider((ref) {
  final moreRepository = ref.watch(MoreRepositoryProvider);
  return MoreController(moreRepository: moreRepository, ref: ref);
});

class MoreController {
  final MoreRepository moreRepository;
  final ProviderRef ref;
  MoreController({
    required this.moreRepository,
    required this.ref,
  });

  Future<UserModel> getUser() async {
    return await moreRepository.getUser();
  }

  Future<void> signOut() async {
    await moreRepository.signOut();
  }

  Future<void> writeArticle(ArticleModel model) async {
    await moreRepository.writeArticle(model);
  }
}
