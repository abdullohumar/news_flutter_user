import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_flutter/models/post_model.dart';

class CardUser extends StatefulWidget {
  const CardUser({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Column(
          children: [
            Hero(
              tag: widget.post.title,
              child: CachedNetworkImage(
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                imageUrl: widget.post.image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) {
                  return const SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator()
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            ListTile(
              title: Text(
                widget.post.title,
                style: const TextStyle(
                  overflow: TextOverflow.visible,
                ),
              ),
              subtitle: Text(
                widget.post.category.name,
                style: const TextStyle(
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}