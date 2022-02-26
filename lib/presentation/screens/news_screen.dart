import 'package:bellis_test/presentation/bloc/news/news_bloc.dart';
import 'package:bellis_test/presentation/screens/saved_news_screen.dart';
import 'package:bellis_test/presentation/widgets/news_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(NewsLoadEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Новости'),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => const SavedNewsScreen()));
              },
              icon: const Icon(Icons.bookmark_border)
            )
          ],
        ),
        body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {

          if (state is NewsLoadedState) {
            return RefreshIndicator(
              child: NewsBlockWidget(
                records: state.records,
              ),
              onRefresh: () async {
                BlocProvider.of<NewsBloc>(context).add(NewsLoadEvent());
              },
            );
          }

          if (state is NewsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(child: Text("Ошибка сети"));

        })
    );
  }

}



