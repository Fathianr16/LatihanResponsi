import 'package:flutter/material.dart';
import 'package:latihanresponsi/list_blogs.dart';
import 'package:latihanresponsi/list_news.dart';
import 'package:latihanresponsi/list_reports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SPACE FLIGHT NEWS",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightGreen.shade300,
              Colors.lightGreen.shade200,
              Colors.lightGreen.shade100,
            ],
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PageListNews();
                    }));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset('assets/images/news.png'),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lime.shade200,
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              'NEWS'),
                          SizedBox(height: 10),
                          Text(
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              'Get an overview of the letest Spaceflight news, from various sources! Easily link your users to the right website.'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PageListBlogs();
                    }));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset('assets/images/blogs.png'),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lime.shade200,
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              'BLOGS'),
                          SizedBox(height: 10),
                          Text(
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            'Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast.',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PageListReports();
                    }));
                  },
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.all(10)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset('assets/images/reports.png'),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.lime.shade200,
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              'REPORTS'),
                          SizedBox(height: 10),
                          Text(
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            'Space stations and other missions often publish their data. With SNAPI, you can include it in your app as well!',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
