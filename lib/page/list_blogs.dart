import 'package:flutter/material.dart';
import 'package:latihanresponsi/model/blogs_model.dart';
import 'package:latihanresponsi/service/base_network.dart';

class PageListBlogs extends StatefulWidget {
  const PageListBlogs({super.key, required blog});

  @override
  State<PageListBlogs> createState() => _PageListBlogsState();
}

class _PageListBlogsState extends State<PageListBlogs> {
  late Future<List<Blog>> blog;

  @override
  void initState() {
    super.initState();
    blog = ApiSource().getBlog();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLOGS LIST",
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
              Colors.lime.shade200,
              Colors.lime.shade100,
              Colors.lime.shade50,
            ],
          ),
        ),
        padding: const EdgeInsets.all(1),
        child: _buildListBlogsBody(),
      ),
    );
  }

  Widget _buildListBlogsBody() {
    return Container(
      child: FutureBuilder<List<Blog>>(
        future: blog,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          } else if (snapshot.hasData) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageListBlogs(blog: snapshot.data![index]);
                        }));
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                child: Image.network(
                                    snapshot.data![index].imageUrl!),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.lime.shade300,
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        snapshot.data![index].title ??
                                            'Judul Tidak Tersedia',
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        snapshot.data![index].newsSite ??
                                            'Site Tidak Tersedia',
                                      ),
                                      Text(
                                        style: const TextStyle(
                                          fontSize: 13,
                                        ),
                                        snapshot.data![index].publishedAt ??
                                            'Publish Tidak Tersedia',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            );
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text('Data Error');
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
