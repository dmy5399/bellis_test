import 'dart:developer';
import 'package:bellis_test/core/env.dart';
import 'package:bellis_test/core/utils.dart';
import 'package:bellis_test/data/models/news_model.dart';
import 'package:bellis_test/presentation/bloc/news/news_bloc.dart';
import 'package:bellis_test/presentation/bloc/saved/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({Key? key}) : super(key: key);

  @override
  _SavedNewsScreenState createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {

  @override
  void initState() {
    BlocProvider.of<SavedBloc>(context).add(SavedLoadEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Новости'),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {

          if (state is NewsLoadedState) {
            return _loaded(state.records, context);
          }

          if (state is NewsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(child: Text("Ошибка"));

        })
    );
  }

  Widget _loaded(records, context){
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewsBloc>(context).add(NewsLoadEvent());
      },
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: records.length,
          itemBuilder: (BuildContext context, int index) {
            NewsModel record = records[index];
            bool isSaved = isNewsSaved(record);

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.network(record.enclosure['url']),
                  const SizedBox(height: 10,),
                  Text(
                    record.title['\$t'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        child: isSaved
                            ?
                        IconButton(
                            onPressed: (){
                              setState(() {
                                BlocProvider.of<SavedBloc>(context).add(SavedRemoveEvent(record));
                              });
                            },
                            icon: const Icon(Icons.bookmark)
                        )
                            :
                        IconButton(
                            onPressed: (){
                              setState(() {
                                BlocProvider.of<SavedBloc>(context).add(SavedSaveEvent(record));
                              });
                            },
                            icon: const Icon(Icons.bookmark_border)
                        ),
                      ),

                    ],
                  ),
                  const Divider()
                ],
              ),
            );
          }
      ),
    );
  }
}



