class TagsModel {
  String? id;
  String? title;

  TagsModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    title = element['title'];
  }
}
