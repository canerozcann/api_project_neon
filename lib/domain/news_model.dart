import 'package:intl/intl.dart';

class NewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  NewsModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    String? rawDate = json['publishedAt'] as String?;
    String? formattedDate;

    if (rawDate != null) {
      try {
        DateTime parsedDate = DateTime.parse(rawDate);
        formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
      } catch (e) {
        formattedDate = rawDate; // parse edilemezse olduğu gibi bırak
      }
    }

    return NewsModel(
      author: json['author'] as String?,
      title: json['title'],
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: formattedDate,
      content: json['content'] as String?,
    );
  }
}
