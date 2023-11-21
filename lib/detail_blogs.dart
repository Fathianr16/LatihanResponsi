import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'blogs_model.dart';

class PageDetailBlogs extends StatelessWidget {
  final Results blog;

  const PageDetailBlogs({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLOGS DETAIL ${blog.id}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              blog.imageUrl ?? '',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 22),
            Text(
              blog.title ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              blog.newsSite ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              blog.publishedAt ?? '',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Text(
              blog.summary ?? '',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _launchURL(blog.url ?? '');
        },
        icon: Icon(Icons.image_search_outlined),
        label: Text("See More"),
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
