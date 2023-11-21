class BlogsModel {
  int? count;
  String? next;
  dynamic previous;
  List<Blog>? results;

  BlogsModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  BlogsModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int?;
    next = json['next'] as String?;
    previous = json['previous'];
    results = (json['results'] as List?)
        ?.map((dynamic e) => Blog.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['count'] = count;
    json['next'] = next;
    json['previous'] = previous;
    json['results'] = results?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Blog {
  int? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  String? updatedAt;
  bool? featured;
  List<dynamic>? launches;
  List<dynamic>? events;

  Blog({
    this.id,
    this.title,
    this.url,
    this.imageUrl,
    this.newsSite,
    this.summary,
    this.publishedAt,
    this.updatedAt,
    this.featured,
    this.launches,
    this.events,
  });

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    url = json['url'] as String?;
    imageUrl = json['image_url'] as String?;
    newsSite = json['news_site'] as String?;
    summary = json['summary'] as String?;
    publishedAt = json['published_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    featured = json['featured'] as bool?;
    launches = json['launches'] as List?;
    events = json['events'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['url'] = url;
    json['image_url'] = imageUrl;
    json['news_site'] = newsSite;
    json['summary'] = summary;
    json['published_at'] = publishedAt;
    json['updated_at'] = updatedAt;
    json['featured'] = featured;
    json['launches'] = launches;
    json['events'] = events;
    return json;
  }
}
