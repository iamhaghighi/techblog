import 'package:techblog/components/apis.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  bool? isFavorite;
  String? createdAt;

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    image = AppApis.baseHostDl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    isFavorite = element['isFavorite'];
    createdAt = element['created_at'];
  }
}
