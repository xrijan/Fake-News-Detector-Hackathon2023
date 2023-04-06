import 'package:flutter/material.dart';
import 'package:news_app/colors.dart';
import 'package:news_app/helper/news_category_data.dart';
import '../../model/news_category_model.dart';

class NewsCategoryScreen extends StatefulWidget {
  const NewsCategoryScreen({Key? key}) : super(key: key);

  @override
  State<NewsCategoryScreen> createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen> {
  final String imageUrl = 'https://www.thesocialhistorian.com/wp-content/uploads/2016/01/Duke_Humfreys_Library_Interior_6_Bodleian_Library_Oxford_UK_-_Diliff-2048x1523.jpg';

  List<NewsCategoryModel> newsCategory = [];

  //hepls run only once whwnever app is lunched
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsCategory = getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        backgroundColor: CustomColor.primaryColor,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:20 , right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Breaking News',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
             const SizedBox(height: 10,),
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Rao IIT Academy institute director held for 'Rs 14 crore GST fraud fggfghfghfgfh fgjffjfh ghhjghj'",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("Learn More"),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.near_me)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            const Text('Generals',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            const SizedBox(height: 10,),
            Expanded(
              child: GridView.builder(
                itemCount: newsCategory.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        newsCategory[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
