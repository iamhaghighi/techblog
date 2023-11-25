import 'package:techblog/gen/assets.gen.dart';

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

final fakeModelBlogList = [
  FakeModelBlogPod(
    image: Assets.images.blog1.path,
    author: "ژینو امینی",
    view: "1356",
    title: "انیمه حمله به تایتان: ۸ نکته که شاید در قسمت آخر از دست داده‌اید!",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog2.path,
    author: "جواد محسنی",
    view: "1278",
    title: "نقد و بررسی بازی Call of Duty: Modern Warfare III",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog3.path,
    author: "پارسا خلیلی",
    view: "9756",
    title:
        "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog3.path,
    author: "پارسا خلیلی",
    view: "9756",
    title:
        "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog3.path,
    author: "پارسا خلیلی",
    view: "9756",
    title:
        "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog3.path,
    author: "پارسا خلیلی",
    view: "9756",
    title:
        "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog3.path,
    author: "پارسا خلیلی",
    view: "9756",
    title:
        "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
  ),
  FakeModelBlogPod(
    image: Assets.images.blog3.path,
    author: "پارسا خلیلی",
    view: "9756",
    title:
        "آیا پانیشر در دنیای سینمایی مارول با درجه سنی بزرگسال تایید میشود یا نه؟",
  ),
];
final fakeModelPodcastList = [
  FakeModelBlogPod(
    image: Assets.images.pod1.path,
    author: "محسن دانشی",
    view: "1356",
    title: "اثری حماسی دراماتیک در وصف داستان غم انگیز",
  ),
  FakeModelBlogPod(
    image: Assets.images.pod2.path,
    author: "علی رضایی",
    view: "1278",
    title: "دو ساعت در دنیای بی رحم بازی تاج و تخت غرق شویدف",
  ),
  FakeModelBlogPod(
    image: Assets.images.pod3.path,
    author: "محمد بختیاری",
    view: "9756",
    title: "Whispers of Forest",
  ),
];

//! TAGS
class FakeModelTags {
  final String title;
  final int id;
  FakeModelTags({required this.title, required this.id});
}

final fakeModelTagsList = [
  FakeModelTags(title: "برنامه نویسی", id: 1),
  FakeModelTags(title: "جاوا", id: 2),
  FakeModelTags(title: "پایتون", id: 3),
  FakeModelTags(title: "پادکست جادی", id: 4),
  FakeModelTags(title: "جاوا اسکریپت", id: 5),
];
