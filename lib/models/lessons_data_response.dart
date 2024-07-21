
class LessonsDataResponse {
  String? message;
  List<Categs>? categs;
  String? error;

  LessonsDataResponse({this.message, this.categs, required String error});

  LessonsDataResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    categs = json["categs"] == null ? null : (json["categs"] as List).map((e) => Categs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    if(categs != null) {
      data["categs"] = categs?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Categs {
  Imagee? image;
  Video? video;
  String? id;
  String? lessonName;
  String? text;
  int? v;

  Categs({this.image, this.video, this.id, this.lessonName, this.text, this.v});

  Categs.fromJson(Map<String, dynamic> json) {
    image = json["image"] == null ? null : Imagee.fromJson(json["image"]);
    video = json["video"] == null ? null : Video.fromJson(json["video"]);
    id = json["_id"];
    lessonName = json["lessonName"];
    text = json["text"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(image != null) {
      data["image"] = image?.toJson();
    }
    if(video != null) {
      data["video"] = video?.toJson();
    }
    data["_id"] = id;
    data["lessonName"] = lessonName;
    data["text"] = text;
    data["__v"] = v;
    return data;
  }
}

class Video {
  String? publicId;
  String? secureUrl;

  Video({this.publicId, this.secureUrl});

  Video.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    secureUrl = json["secure_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["public_id"] = publicId;
    data["secure_url"] = secureUrl;
    return data;
  }
}

class Imagee {
  String? publicId;
  String? secureUrl;

  Imagee({this.publicId, this.secureUrl});

  Imagee.fromJson(Map<String, dynamic> json) {
    publicId = json["public_id"];
    secureUrl = json["secure_url"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["public_id"] = publicId;
    data["secure_url"] = secureUrl;
    return data;
  }
}