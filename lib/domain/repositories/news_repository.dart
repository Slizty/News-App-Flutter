import 'package:dartz/dartz.dart';
import '../entities/article.dart';
import '../../core/error/failures.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Article>>> getTopHeadlines();
}