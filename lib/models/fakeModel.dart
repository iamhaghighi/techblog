class FakeModelBlogPod {
  final String image;
  final String author;
  final String view;
  final String title;

  FakeModelBlogPod({
    required this.image,
    required this.author,
    required this.view,
    required this.title,
  });
}

class FakeModelTags {
  final String title;
  final int id;
  FakeModelTags({required this.title, required this.id});
}