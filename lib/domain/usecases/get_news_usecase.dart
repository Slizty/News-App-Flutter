import 'package:dartz/dartz.dart';
import '../entities/article.dart';
import '../repositories/news_repository.dart';
import '../../core/error/failures.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<Either<Failure, List<Article>>> call() async {
    return await repository.getTopHeadlines();
  }
}