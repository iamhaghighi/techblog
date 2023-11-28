import 'package:techblog/components/apis.dart';

class ArticleContentModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleContentModel();

  ArticleContentModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
    content = element['content'];
    image = AppApis.baseHostDl + element['image'];
    catId = element['cat_id'];
    catName = element['cat_name'];
    author = element['author'];
    view = element['view'];
    status = element['status'];
    createdAt = element['created_at'];
    isFavorite = element["isFavorite"];
  }
}
