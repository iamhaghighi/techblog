class AppApis {
  static const base = "https://techblog.sasansafari.com/Techblog/api/";
  static const baseHostDl = "https://techblog.sasansafari.com";
  static const poster = "${base}home/?command=index";
  static const newArticle = "${base}article/get.php?command=new&user_id=1";
  static const publishedByMe =
      "${base}article/get.php?command=published_by_me&user_id=";
  static const registerAndVerifyCode = "${base}register/action.php";
  static const postArticle = "${base}article/post.php";
}
