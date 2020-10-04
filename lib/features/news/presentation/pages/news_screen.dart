import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/widgets/custom_scaffold.dart';
import 'package:genius_demo/features/news/presentation/cubit/news_cubit.dart';
import 'package:genius_demo/features/news/presentation/widgets/category_list.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    context.bloc<NewsCubit>().getNewsEvent(category: 'business');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "NEWS",
      body: Column(
        children: [
          CategoryList(),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
