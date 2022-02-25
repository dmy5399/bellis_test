import 'dart:developer';

import 'package:bellis_test/data/models/news_model.dart';
import 'package:bellis_test/presentation/bloc/news/news_bloc.dart';
import 'package:bellis_test/presentation/bloc/saved/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsBloc>(context).add(NewsLoadEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {

        if (state is NewsLoadedState) {
          return _loaded(state.records);
        }

        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        return const Center(child: Text("Ошибка сети"));

      })
    );
  }

  Widget _loaded(records){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: records.length,
        itemBuilder: (BuildContext context, int index) {
          NewsModel record = records[index];

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
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: (){
                        BlocProvider.of<SavedBloc>(context).add(SavedSaveEvent(record));
                      },
                      icon: const Icon(Icons.bookmark_border)
                    )
                  ],
                ),
                const Divider()
              ],
            ),
          );
        }
    );
  }
}
