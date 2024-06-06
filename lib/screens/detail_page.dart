import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart'; // Imported flutter_widget_from_html package
import 'package:news_flutter/models/post_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key, // Added Key? key parameter
    required this.post,
  }); // Added super(key: key)

  final Post post;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
      ),
      body: Column(
        children: [
          // Hero(
          //   tag: post.id,
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.40,
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: NetworkImage(post.image),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          Hero(
            tag: widget.post.id,
            child: CachedNetworkImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.40,
              fit: BoxFit.fill,
              imageUrl: widget.post.image,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: HtmlWidget( // Changed Text widget to HtmlWidget from flutter_widget_from_html package
                widget.post.content, // Passing post.content to HtmlWidget
              ),
            ),
          ),
        ],
      ),
    );
  }
}
