// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_flutter/api/categories_repository.dart';
import 'package:news_flutter/common_widgets/card.dart';
import 'package:news_flutter/common_widgets/carousel.dart';
import 'package:news_flutter/models/categories_model.dart';
import 'package:news_flutter/models/post_model.dart';
import 'package:news_flutter/screens/detail_page.dart';

class ListPost extends StatefulWidget {
  const ListPost({
    super.key,
    required this.posts,
  });

  final Future<List<Post>> posts;

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  late Future<List<CategoryModel>> categories;

  @override
  void initState() {
    super.initState();
    categories = CategoryRepository.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8.0),
            child: Row(
              children: [
                Icon(Icons.category_outlined),
                Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          const Divider(
            height: 11.0,
            color: Colors.grey,
          ),
          CategoryCarousel(categoriesFuture: categories,),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 8.0),
            child: Row(
              children: [
                Icon(Icons.newspaper_outlined),
                Text('News', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          const Divider(
            height: 11.0,
            color: Colors.grey,
          ),
          FutureBuilder<List<Post>>(
            future: widget.posts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(post: post),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardUser(post: post),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
