import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genius_demo/core/extensions/context_extension.dart';
import 'package:genius_demo/core/utils/text_style.dart';
import 'package:genius_demo/features/news/presentation/cubit/news_cubit.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<NewsCategory> categoryList = [
    NewsCategory(name: "business", isSelected: true),
    NewsCategory(name: "entertainment", isSelected: false),
    NewsCategory(name: "general", isSelected: false),
    NewsCategory(name: "health", isSelected: false),
    NewsCategory(name: "science", isSelected: false),
    NewsCategory(name: "sports", isSelected: false),
    NewsCategory(name: "technology", isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14, top: 10),
      child: Container(
        height: 30,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (ctx, index) {
            NewsCategory category = categoryList[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.theme.corePalatte.colorPrimary,
                      width: 2,
                    ),
                    color: category.isSelected
                        ? context.theme.corePalatte.colorPrimary
                        : context.theme.surface),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < categoryList.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            categoryList[buttonIndex].isSelected = true;
                          } else {
                            categoryList[buttonIndex].isSelected = false;
                          }
                        }
                      });
                      BlocProvider.of<NewsCubit>(context)
                          .getNewsEvent(category: category.name);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        categoryList[index].name,
                        style: StyleText.montMedium.copyWith(
                          color: category.isSelected
                              ? Colors.white
                              : context.theme.textColor,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewsCategory {
  String name;
  bool isSelected;

  NewsCategory({this.name, this.isSelected});
}
