import 'package:bellis_test/presentation/bloc/news/news_bloc.dart';
import 'package:bellis_test/presentation/bloc/saved/saved_bloc.dart';
import 'package:bellis_test/presentation/widgets/news_block_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          title: const Text('Сохраненное'),
          leading: IconButton(
            onPressed: (){
              BlocProvider.of<NewsBloc>(context).add(NewsLoadEvent());
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {

          if (state is SavedLoadedState) {
            return NewsBlockWidget(
                records: state.records
            );
          }

          if (state is SavedLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(child: Text("Ошибка"));

        })
    );
  }

}



