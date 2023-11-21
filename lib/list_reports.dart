import 'package:flutter/material.dart';
import 'package:latihanresponsi/report_model.dart';
import 'space_data_source.dart';
import 'detail_reports.dart';

class PageListReports extends StatefulWidget {
  const PageListReports({Key? key}) : super(key: key);

  @override
  State<PageListReports> createState() => _PageListReportsState();
}

class _PageListReportsState extends State<PageListReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REPORTS LIST",
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
        child: _buildListReportsBody(),
      ),
    );
  }

  Widget _buildListReportsBody() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: ApiDataSource.instance.loadReports(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            Report reports = Report.fromJson(snapshot.data);
            return _buildSuccessSection(reports);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(Report data) {
    return ListView.builder(
      itemCount: data.results!.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(2),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PageDetailReports(report: data.results![index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 120,
                      child: Image.network(
                        data.results![index].imageUrl!,
                        fit: BoxFit.cover,
                      ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              data.results![index].title ??
                                  'Judul Tidaak Tersedia',
                            ),
                            SizedBox(height: 10),
                            Text(
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                              data.results![index].newsSite ??
                                  'Site Tidak Tersedia',
                            ),
                            Text(
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                              data.results![index].updatedAt ??
                                  'Site Tidak Tersedia',
                            ),
                          ],
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
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
