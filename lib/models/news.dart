import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.data,
    this.message,
  });

  List<NewsItem> data;
  String message;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        data:
            List<NewsItem>.from(json["Data"].map((x) => NewsItem.fromJson(x))),
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "Message": message,
      };
}

class NewsItem {
  NewsItem({
    this.newsId,
    this.khabarTitle,
    this.khabarDetails,
    this.khabarDate,
    this.authorId,
    this.menuId,
    this.langId,
    this.newsFlash,
    this.newsTop,
    this.active,
    this.bulletins,
    this.bulletinsOrdering,
    this.reporterApprove,
    this.editorApprove,
    this.directorApprove,
    this.readCounter,
    this.picTitle,
    this.pic,
    this.editorId,
    this.directorId,
    this.newsDate2,
    this.oldAuthorId,
    this.oldEditorId,
    this.oldDirectorId,
    this.isBreakingNews,
    this.pic1,
    this.pic2,
    this.pic3,
    this.pic4,
    this.pic5,
    this.isNewVersion,
  });

  int newsId;
  String khabarTitle;
  String khabarDetails;
  DateTime khabarDate;
  int authorId;
  int menuId;
  int langId;
  int newsFlash;
  int newsTop;
  int active;
  dynamic bulletins;
  dynamic bulletinsOrdering;
  int reporterApprove;
  int editorApprove;
  int directorApprove;
  int readCounter;
  dynamic picTitle;
  String pic;
  int editorId;
  int directorId;
  DateTime newsDate2;
  dynamic oldAuthorId;
  dynamic oldEditorId;
  dynamic oldDirectorId;
  bool isBreakingNews;
  String pic1;
  dynamic pic2;
  dynamic pic3;
  dynamic pic4;
  dynamic pic5;
  int isNewVersion;

  factory NewsItem.fromJson(Map<String, dynamic> json) => NewsItem(
        newsId: json["News_ID"],
        khabarTitle: json["Khabar_Title"],
        khabarDetails: json["Khabar_Details"],
        khabarDate: DateTime.parse(json["Khabar_Date"]),
        authorId: json["Author_ID"],
        menuId: json["Menu_ID"],
        langId: json["Lang_ID"],
        newsFlash: json["News_Flash"],
        newsTop: json["News_Top"],
        active: json["Active"],
        bulletins: json["Bulletins"],
        bulletinsOrdering: json["Bulletins_Ordering"],
        reporterApprove: json["Reporter_Approve"],
        editorApprove: json["Editor_Approve"],
        directorApprove: json["Director_Approve"],
        readCounter: json["Read_Counter"],
        picTitle: json["Pic_Title"],
        pic: json["Pic"],
        editorId: json["Editor_ID"],
        directorId: json["Director_ID"],
        newsDate2: DateTime.parse(json["News_Date2"]),
        oldAuthorId: json["Old_Author_ID"],
        oldEditorId: json["Old_Editor_ID"],
        oldDirectorId: json["Old_Director_ID"],
        isBreakingNews: json["IsBreakingNews"],
        pic1: json["Pic_1"] == null ? null : json["Pic_1"],
        pic2: json["Pic_2"],
        pic3: json["Pic_3"],
        pic4: json["Pic_4"],
        pic5: json["Pic_5"],
        isNewVersion: json["IsNewVersion"],
      );

  Map<String, dynamic> toJson() => {
        "News_ID": newsId,
        "Khabar_Title": khabarTitle,
        "Khabar_Details": khabarDetails,
        "Khabar_Date": khabarDate.toIso8601String(),
        "Author_ID": authorId,
        "Menu_ID": menuId,
        "Lang_ID": langId,
        "News_Flash": newsFlash,
        "News_Top": newsTop,
        "Active": active,
        "Bulletins": bulletins,
        "Bulletins_Ordering": bulletinsOrdering,
        "Reporter_Approve": reporterApprove,
        "Editor_Approve": editorApprove,
        "Director_Approve": directorApprove,
        "Read_Counter": readCounter,
        "Pic_Title": picTitle,
        "Pic": pic,
        "Editor_ID": editorId,
        "Director_ID": directorId,
        "News_Date2": newsDate2.toIso8601String(),
        "Old_Author_ID": oldAuthorId,
        "Old_Editor_ID": oldEditorId,
        "Old_Director_ID": oldDirectorId,
        "IsBreakingNews": isBreakingNews,
        "Pic_1": pic1 == null ? null : pic1,
        "Pic_2": pic2,
        "Pic_3": pic3,
        "Pic_4": pic4,
        "Pic_5": pic5,
        "IsNewVersion": isNewVersion,
      };
}
