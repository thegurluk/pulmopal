import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pulmopal/models/article_model.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/blog/blogeWrite/repository/common_firebase_storage_repository.dart';
import 'package:pulmopal/pages/blog/blogeWrite/utils.dart';
import 'package:pulmopal/pages/settings/accountedits/controller/more_controller.dart';
import 'package:uuid/uuid.dart';

class WriteArticle extends ConsumerStatefulWidget {
  final UserModel currentUser;
  const WriteArticle({super.key, required this.currentUser});

  @override
  ConsumerState<WriteArticle> createState() => _WriteArticleState();
}

class _WriteArticleState extends ConsumerState<WriteArticle> {
  XFile? image;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void pickImage() async {
    image = await pickImageFromGallery();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 14, 14, 12),
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final user = widget.currentUser;
                  ref
                      .read(commonFSRepositoryProvider)
                      .storeFileToFirebase(
                        "articles/${user.uid}/${DateTime.now().millisecondsSinceEpoch}",
                        File(image!.path),
                      )
                      .then((value) {
                    String uid = const Uuid().v4();
                    ArticleModel articleModel = ArticleModel(
                      uid: uid,
                      title: _titleController.text,
                      content: _contentController.text,
                      coverImg: value,
                      author: "${user.name} ${user.surname}",
                      autherUid: user.uid!,
                      authorImg: user.profilePhoto!,
                      createdAt: DateTime.now(),
                      claps: 0,
                      views: 0,
                    );
                    ref
                        .read(MoreControllerProvider)
                        .writeArticle(articleModel)
                        .then((value) => Navigator.pop(context));
                  });
                }
              },
              icon: const Icon(
                Icons.done_all,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 40,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                    child: Text(
                  'Add your Article',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFF273C4F), Color(0xFF517DA0)]),
                          borderRadius: BorderRadius.circular(20),
                          image: image != null
                              ? DecorationImage(
                                  image: FileImage(File(image!.path)),
                                  fit: BoxFit.cover)
                              : null),
                      child: IconButton(
                          onPressed: () {
                            pickImage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 50,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "fill the content";
                      }
                      return null;
                    },
                    controller: _titleController,
                    decoration: const InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(
                          fontSize: 30,
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "fill the content";
                        }
                        return null;
                      },
                      maxLines: 100,
                      controller: _contentController,
                      decoration: const InputDecoration(
                          hintText: "write",
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
