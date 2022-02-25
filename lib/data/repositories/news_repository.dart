import 'package:bellis_test/core/exceptions.dart';
import 'package:bellis_test/data/datasources/news_remote_datasource.dart';
import 'package:bellis_test/data/models/news_model.dart';

class NewsRepository {
  Future<List<NewsModel>> getAll() async {
    NewsRemoteDatasource datasource = NewsRemoteDatasource();
    try{
      return await datasource.getAll();
    } catch (e) {
      throw ServerException();
    }
  }
}