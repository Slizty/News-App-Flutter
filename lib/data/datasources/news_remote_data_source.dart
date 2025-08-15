import 'package:dio/dio.dart';
import '../models/article_model.dart';
import '../../core/error/exceptions.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;
  static const String apiKey = 'f1ecb5130b7b47e288c9d2d76f9fe1e5';
  static const String baseUrl = 'https://newsapi.org/v2';

  NewsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> getTopHeadlines() async {
    try {
      final response = await dio.get(
        '$baseUrl/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        return articles.map((json) => ArticleModel.fromJson(json)).toList();
      } else {
        throw ServerException('Failed to fetch news');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException('Network error occurred');
      } else {
        throw ServerException('Server error: ${e.response?.statusCode}');
      }
    } catch (e) {
      throw ServerException('Unexpected error occurred');
    }
  }
}