import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/enums/core_enums.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/core/theme/presentation/bloc/theme_cubit.dart';
import 'package:genius_demo/di.dart';
import 'package:genius_demo/features/news/presentation/cubit/news_cubit.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.bloc<NewsCubit>().getLatestNewsEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsLoaded) {
            return ListView.builder(
                itemCount: state.newsResponse.articles.length,
                itemBuilder: (context, index) {
                  final article = state.newsResponse.articles[index];
                  return Text(article.title);
                });
          } else if (state is NewsError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Center(
              child: Text("Some Errors"),
            );
          }
          // return Center(
          //     child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Switch(
          //         value: context.theme.themeType == ThemeType.dark,
          //         onChanged: (bool status) {
          //           sl<ThemeCubit>().switchTheme(
          //             context.theme.themeType,
          //           );
          //         }),
          //     RaisedButton(
          //         onPressed: () {
          //           sl<NewsCubit>().getLatestNewsEvent();
          //         },
          //         child: Text("Get Data")),
          //   ],
          // ));
        },
      ),
    );
  }
}
