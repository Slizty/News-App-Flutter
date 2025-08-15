
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'data/datasources/news_remote_data_source.dart';
import 'data/repositories/news_repository_impl.dart';
import 'domain/usecases/get_news_usecase.dart';
import 'presentation/providers/news_provider.dart';
import 'presentation/pages/news_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final newsRemoteDataSource = NewsRemoteDataSourceImpl(dio);
    final newsRepository = NewsRepositoryImpl(newsRemoteDataSource);
    final getNewsUseCase = GetNewsUseCase(newsRepository);

    return ChangeNotifierProvider(
      create: (_) => NewsProvider(getNewsUseCase),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: NewsListPage(),
      ),
    );
  }
}