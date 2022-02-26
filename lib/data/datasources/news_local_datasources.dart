import 'dart:convert';
import 'dart:developer';
import 'package:bellis_test/core/env.dart';
import 'package:bellis_test/core/exceptions.dart';
import 'package:bellis_test/core/utils.dart';
import 'package:bellis_test/data/models/news_model.dart';

class NewsLocalDatasource {

  List<NewsModel> getAll() {

    try {
      List<String>? cached = prefs.getStringList(SAVED_PREFS);
      cached ??= [];

      return cached.map((json) => NewsModel.fromJson(jsonDecode(json))).toList();
    } catch (e) {
      throw Exception();
    }

  }

  void saveLocal(NewsModel record)  {
    bool isSaved = isNewsSaved(record);

    if(isSaved) {
      throw SaveLocalException();
    }

    String json = jsonEncode(record.toJson());

    List<String>? cached = prefs.getStringList(SAVED_PREFS);
    cached ??= [];

    cached.add(json);

    prefs.setStringList(SAVED_PREFS, cached);

  }

  void removeLocal(NewsModel record)  {
    bool isSaved = isNewsSaved(record);

    if(!isSaved) {
      throw SaveLocalException();
    }

    String json = jsonEncode(record.toJson());

    List<String>? cached = prefs.getStringList(SAVED_PREFS);

    cached?.remove(json);

    prefs.setStringList(SAVED_PREFS, cached!);

  }

}