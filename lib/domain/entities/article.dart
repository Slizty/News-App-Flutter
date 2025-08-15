import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime publishedAt;
  final String content;

  const Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.content,
  });

  @override
  List<Object> get props => [title, description, imageUrl, publishedAt, content];
}