import '../model/news_category_model.dart';

//it is a list that can contain elements of type NewsCategory.
// The variable is then initialized to an empty list using <NewsCategory>[].

List<NewsCategoryModel> getCategory() {
  List<NewsCategoryModel> newsCategory = [];

  NewsCategoryModel newsCategoryModel = NewsCategoryModel(
    imageUrl: 'https://img.freepik.com/free-vector/egyptian-sphinx_53876-34778.jpg?w=1380&t=st=1680465054~exp=1680465654~hmac=c2035be07c7f678b1e8ee669a61a6cbc3733a593f47a0a272c4cf4486847c6d2',
    name: 'History',
  );
  newsCategory.add(newsCategoryModel);


  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-vector/diplomacy-diplomat-isometric-concept-two-men-discussing-important-political-issues-vector-illustration_1284-78093.jpg?w=1380&t=st=1680464883~exp=1680465483~hmac=b0a57af127dfb7bcf3ba3a12c10047c1532fe9ae1b2de5c31fd00643a9dec4fb',
      name: 'Politics');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-vector/university-student-cap-mortar-board-diploma_3446-334.jpg?w=1380&t=st=1680464786~exp=1680465386~hmac=189908c77d5c2b3503ee9d29f82f1ef6613330415801dd2d4b7a21a2ddb8709a',
      name: 'Education');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-vector/photographer-videographer-isometric-composition-with-roped-off-area-policemen-people-near-scene-crime_1284-32133.jpg?w=1380&t=st=1680464959~exp=1680465559~hmac=ddef5dacda48f90ae8053dc9ba08a115b6750591ba221c4873cacde1546482ab',
      name: 'Crime');
  newsCategory.add(newsCategoryModel);


  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-photo/basketball-player-jumping-dunking-3d-line-drawing-design_460848-8042.jpg?w=1060&t=st=1680457285~exp=1680457885~hmac=679fa9e251d46b7eed798657ae4b255b63e265f0a00dcd4314cd883aca371694',
      name: 'Sports');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-vector/cinema-concept_1284-12713.jpg?w=1060&t=st=1680457496~exp=1680458096~hmac=0d58ecb51b72248baf30a5b697cf95f6203771fda971b2b0bf7f911625809152',
      name: 'Entertainment');
  newsCategory.add(newsCategoryModel);

  return newsCategory;
}
