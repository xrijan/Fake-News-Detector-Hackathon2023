import 'package:flutter/material.dart';
import 'package:news_app/helper/news_category_data.dart';
import 'package:news_app/screen/NewsCetegory/news_catogeries_selected.dart';
import '../../model/news_category_model.dart';
import '../../model/news_model.dart';

class NewsCategoryScreen extends StatefulWidget {
  const NewsCategoryScreen({Key? key}) : super(key: key);

  @override
  State<NewsCategoryScreen> createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen> {
  List<NewsCategoryModel> newsCategory = [];
  List<NewsModel> newsArticle = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //just has a component of categories like text and image
    newsCategory = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: newsCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectedNewsCategories(title: newsCategory[index].name, category: newsCategory[index].name.toLowerCase(),)),
                );
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(newsCategory[index].imageUrl),
                  radius: 45.0,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
