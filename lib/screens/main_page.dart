import 'package:flutter/material.dart';
import 'package:news_flutter/api/post_repository.dart';
import 'package:news_flutter/common_widgets/list_post.dart';
import 'package:news_flutter/models/post_model.dart';
import 'package:news_flutter/screens/drawer_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Post>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = Api.getPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Activity'),
        centerTitle: true,
      ),
      drawer: const DrawerPage(),
      body: ListPost(posts: _posts),
    );
  }
}

