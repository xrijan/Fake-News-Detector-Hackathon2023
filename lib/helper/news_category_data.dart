import '../model/news_category_model.dart';

//it is a list that can contain elements of type NewsCategory.
// The variable is then initialized to an empty list using <NewsCategory>[].

List<NewsCategoryModel> getCategory() {
  List<NewsCategoryModel> newsCategory = [];

  NewsCategoryModel newsCategoryModel = NewsCategoryModel(
    imageUrl: 'https://img.freepik.com/free-psd/3d-character-young-man-with-business-concept_1150-64144.jpg?w=1380&t=st=1680797397~exp=1680797997~hmac=68464f0574100abea42bda01f08ff2ccd4dc4480a717a7e2d07446957cd940e1',
    name: 'Business',
  );
  newsCategory.add(newsCategoryModel);


  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-vector/virtual-reality-friends-cartoons_18591-52227.jpg?w=1380&t=st=1680797448~exp=1680798048~hmac=c0a10559f11d73ce67046810b58185624571ecc02a80a017d3acdb19c64ad82a',
      name: 'Technology');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
      'https://img.freepik.com/free-vector/cinema-concept_1284-12713.jpg?w=1060&t=st=1680457496~exp=1680458096~hmac=0d58ecb51b72248baf30a5b697cf95f6203771fda971b2b0bf7f911625809152',
      name: 'Entertainment');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
      'https://img.freepik.com/free-photo/basketball-player-jumping-dunking-3d-line-drawing-design_460848-8042.jpg?w=1060&t=st=1680457285~exp=1680457885~hmac=679fa9e251d46b7eed798657ae4b255b63e265f0a00dcd4314cd883aca371694',
      name: 'Sports');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
      'https://img.freepik.com/free-psd/3d-rendering-back-school-icon_23-2149589327.jpg?w=1380&t=st=1680797549~exp=1680798149~hmac=ccbb481397c89fd3d1448f4532a87e652cdd8da8025f3cc24da1874eee8b8518',
      name: 'Science');
  newsCategory.add(newsCategoryModel);

  newsCategoryModel = NewsCategoryModel(
      imageUrl:
          'https://img.freepik.com/free-photo/hands-holding-red-heart-heartbeat-wave-family-health-care-concept-white-background-3d-illustration_56104-1547.jpg?w=1800&t=st=1680797499~exp=1680798099~hmac=66f0f0c6e3bba08a54ee39e04e324a437c37c9ed7723491fa7c834183b3316bf',
      name: 'Health');
  newsCategory.add(newsCategoryModel);




  return newsCategory;
}
