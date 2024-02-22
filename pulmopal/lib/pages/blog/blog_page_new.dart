import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pulmopal/models/article_model.dart';
import 'package:pulmopal/models/user_model.dart';
import 'package:pulmopal/pages/blog/blogeWrite/add_write.dart';
import 'package:pulmopal/pages/blog/controller/blog_controller.dart';
import 'package:pulmopal/pages/settings/accountedits/controller/more_controller.dart';
import 'package:pulmopal/widgets/app_bar.dart';
import 'package:pulmopal/widgets/bottom_bar.dart';

class BlogPageNew extends ConsumerWidget {
  const BlogPageNew({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomBar(context),
      body: StreamBuilder<List<ArticleModel>>(
          stream: ref.watch(browseControllerProvider).getArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              List<ArticleModel> articles = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {
                  final article = articles[index];
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 300,
                        width: 380,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          article.authorImg),
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        article.author,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 10, 9, 9),
                                        ),
                                      ),
                                      Text(
                                        DateFormat("dd.MM.y")
                                            .format(article.createdAt),
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  article.title,
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  article.content,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 200,
                                    width: 360,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            article.coverImg!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return const Center(
                child: Text("No Data"),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const BlogPage2(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BlogPage2 extends ConsumerWidget {
  const BlogPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: FutureBuilder<UserModel>(
            future: ref.read(MoreControllerProvider).getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final UserModel currentUser = snapshot.data!;
                return WriteArticle(currentUser: currentUser);
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
