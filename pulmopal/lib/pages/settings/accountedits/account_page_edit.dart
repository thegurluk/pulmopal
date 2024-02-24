import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:image_picker/image_picker.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/blog/blogeWrite/repository/common_firebase_storage_repository.dart';
import 'package:pulmopal/pages/blog/blogeWrite/utils.dart';
import 'package:pulmopal/pages/settings/accountedits/controller/more_controller.dart';
import 'package:pulmopal/widgets/app_bar.dart';

class AccountPageEdit extends StatefulWidget {
  const AccountPageEdit({super.key, required this.currentUser});
  final UserModel currentUser;
  @override
  State<AccountPageEdit> createState() => _AccountPageEditState();
}

class _AccountPageEditState extends State<AccountPageEdit> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image;

  void selectImage() async {
    _image = await pickImageFromGallery();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.currentUser.name;
    _surnameController.text = widget.currentUser.surname;
    _emailController.text = widget.currentUser.email;
    _usernameController.text = "@${widget.currentUser.username}";
    _descriptionController.text = widget.currentUser.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar1(),
        body: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 400,
                height: 50,
                margin: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'Profile Settings',
                    style: TextStyle(color: Colors.black, fontSize: 31),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => selectImage(),
                child: CircleAvatar(
                  radius: 70,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: _image != null
                        ? FileImage(File(_image!.path)) as ImageProvider
                        : CachedNetworkImageProvider(
                            widget.currentUser.profilePhoto!,
                          ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: _nameController,
                validator: (value) {
                  return null;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                validator: (value) {
                  return null;
                },
                controller: _surnameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                validator: (value) {
                  return null;
                },
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                validator: (value) {
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'teambam@gmail.com',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      // obscureText: sifre_gozukme,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: '*********',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: '20',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Asthma',
                ),
              ),
            ),
            Column(
              children: [
                Consumer(builder: (context, ref, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () async {
                        widget.currentUser.name = _nameController.text;
                        widget.currentUser.surname = _surnameController.text;
                        widget.currentUser.email = _emailController.text;
                        widget.currentUser.username = _usernameController.text;
                        widget.currentUser.description =
                            _descriptionController.text;

                        if (_image != null) {
                          widget.currentUser.profilePhoto = await ref
                              .read(commonFSRepositoryProvider)
                              .storeFileToFirebase(
                                "profilePhotos/${widget.currentUser.uid}",
                                File(_image!.path),
                              );
                        } else {
                          widget.currentUser.profilePhoto =
                              widget.currentUser.profilePhoto;
                        }
                        UserModel userModel = widget.currentUser;
                        await ref
                            .read(MoreControllerProvider)
                            .updateProfile(userModel)
                            .then(
                              (value) => () => Navigator.pop(context),
                            );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.blue,
                      minWidth: double.infinity,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                })
              ],
            )
          ],
        ));
  }
}
