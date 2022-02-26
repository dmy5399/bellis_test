import 'package:bellis_test/core/utils.dart';
import 'package:bellis_test/data/models/news_model.dart';
import 'package:bellis_test/presentation/bloc/saved/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBlockWidget extends StatefulWidget {
  final List<NewsModel> records;

  const NewsBlockWidget({
    required this.records,
    Key? key
  }) : super(key: key);

  @override
  _NewsBlockWidgetState createState() => _NewsBlockWidgetState();
}

class _NewsBlockWidgetState extends State<NewsBlockWidget> {
  @override
  Widget build(BuildContext context) {
    var records = widget.records;

    if(records.isEmpty) {
      return const Center(child: Text("Нет записей"),);
    } else {
      return ListView.builder(
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
      );
    }

  }
}
