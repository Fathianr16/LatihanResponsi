import 'package:flutter/material.dart';
import 'package:latihanresponsi/model/news_model.dart';

class PageDetailNews extends StatefulWidget {
  const PageDetailNews({Key? key, required this.berita});

  final News berita;

  @override
  State<PageDetailNews> createState() => _PageDetailNewsState();
}

class _PageDetailNewsState extends State<PageDetailNews> {
  late Future<List<News>> berita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLOGS DETAIL ${widget.berita.id} ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lime,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal.shade200,
              Colors.teal.shade100,
              Colors.teal.shade50,
            ],
          ),
        ),
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: double.infinity,
        child: _buildDetailNewsBody(),
      ),
    );
  }

  Widget _buildDetailNewsBody() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: FutureBuilder<List<News>>(
        future: berita,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingSection();
          } else if (snapshot.hasError) {
            debugPrint(snapshot.toString());
            return _buildErrorSection();
          } else if (snapshot.hasData) {
            return _buildSuccessSection();
          } else {
            return const ListTile(
              title: Text("Detail News tidak ditemukan"),
            );
          }
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Data Error");
  }

  Widget _buildLoadingSection() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12),
          Text(
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            widget.berita.title!,
          ),
          SizedBox(height: 12),
          Text(
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            widget.berita.newsSite!,
          ),
          Text(
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            widget.berita.publishedAt!,
          ),
          SizedBox(height: 12),
          Text(
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            widget.berita.summary!,
          ),
        ],
      ),
    );
  }
}
