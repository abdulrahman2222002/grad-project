import 'package:image_painter/image_painter.dart';

class TypingLettersDataResponse {
  String? message;
  List<Ques>? ques;
  String? error;

  TypingLettersDataResponse({this.message, this.ques,this.error});

  TypingLettersDataResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    ques = json["ques"] == null ? null : (json["ques"] as List).map((e) => Ques.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if(ques != null) {
      _data["ques"] = ques?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Ques {
  Image? image;
  String? id;
  String? lessonName;
  String? titleOfQues;
  String? text;
  ImagePainterController? imagePainterController;
  int? score;
  int? v;

  Ques({this.image, this.id, this.lessonName, this.titleOfQues, this.text, this.score, this.v,required this.imagePainterController});

  Ques.fromJson(Map<String, dynamic> json) {
    image = json["image"] == null ? null : Image.fromJson(json["image"]);
    id = json["_id"];
    lessonName = json["lessonName"];
    titleOfQues = json["titleOfQues"];
    text = json["text"];
    score = json["score"];
    v = json["__v"];
    imagePainterController=ImagePainterController(mode: PaintMode.freeStyle);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(image != null) {
      _data["image"] = image?.toJson();
    }
    _data["_id"] = id;
    _data["lessonName"] = lessonName;
    _data["titleOfQues"] = titleOfQues;
    _data["text"] = text;
    _data["score"] = score;
    _data["__v"] = v;
    return _data;
  }
}

class Image {
  String? publicId;
  String? secureUrl;

  Image({this.publicId, this.secureUrl});

  Image.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    secureUrl = json["secure_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["public_id"] = publicId;
    _data["secure_url"] = secureUrl;
    return _data;
  }
}