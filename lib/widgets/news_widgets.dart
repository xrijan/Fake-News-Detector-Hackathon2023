
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/news_model.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
    required this.newsArticle,
    required this.index,
  });

  final List<NewsModel> newsArticle;
  final int index;

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColor.secondaryColor,
        border: Border(
            top: BorderSide(
              color: Colors.white,
            ),
            bottom: BorderSide(
              color: Colors.white,
            )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 260,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.newsArticle[widget.index].urlToImage,
                  fit: BoxFit.fill,
                )),
          ),
          const SizedBox(
            height: 10,
          ),

          ///tittle
          Text(
            widget.newsArticle[widget.index].title,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///publisher
              Text(
                widget.newsArticle[widget.index].publishedAt,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                width: 100,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.share)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.verified_user_rounded)),
            ],
          )
        ],
      ),
    );
  }
}