import 'package:flutter/foundation.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_news_usecase.dart';

class NewsProvider with ChangeNotifier {
  final GetNewsUseCase getNewsUseCase;

  NewsProvider(this.getNewsUseCase);

  List<Article> _articles = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  bool get hasError => _errorMessage.isNotEmpty;

  Future<void> loadNews() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await getNewsUseCase();

    result.fold(
          (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
          (articles) {
        _articles = articles;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}