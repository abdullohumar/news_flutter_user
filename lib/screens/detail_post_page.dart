import 'package:flutter/material.dart';
import 'package:news_flutter/api/post_repository.dart';
import 'package:news_flutter/models/post_model.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({super.key});

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = Api.getPosts( context );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Post Information'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.photo_size_select_actual_rounded),
                                  const SizedBox(width: 10.0),
                                  Text(post.title),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(' ID ', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 10.0),
                                  Text(post.user.id.toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.person),
                                  const SizedBox(width: 10.0),
                                  Text(post.user.name),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(width: 10.0),
                                  Text(post.user.email),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
    );
  }
}
