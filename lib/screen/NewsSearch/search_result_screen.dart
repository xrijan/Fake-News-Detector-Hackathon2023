import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/new_search_data.dart';
import 'package:news_app/model/news_search_model.dart';
import '../../colors.dart';
import '../../widgets/appbar_widgets.dart';
import '../../widgets/newsWidget_search.dart';

class SearchResult extends StatefulWidget {
  final String query;
  const SearchResult({required this.query, Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SelectedNewsCategoriesState();
}

class _SelectedNewsCategoriesState extends State<SearchResult> {
  List<NewsSearchModel> newsArticleBySearch = [];

  Future<void> getNews() async {
    NewsSearch newsSearch = NewsSearch();
    await newsSearch.getSearchNews(widget.query);
    setState(() {
      newsArticleBySearch = newsSearch.newsFromRestApi;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBarWidgets(
        icon: Icons.backspace,
        title: widget.query,
      ),
      body: newsArticleBySearch.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            )
          : RefreshIndicator(
              color: Colors.black,
              onRefresh: () => getNews(),
              child: ListView.builder(
                  itemCount: newsArticleBySearch.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NewSearchWidget(
                        newsArticle: newsArticleBySearch, index: index);
                  }),
            ),
    );
  }
}
