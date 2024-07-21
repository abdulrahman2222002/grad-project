
class LevelsDataResponse {
    String? message;
    int? page;
    List<Levels>? levels;
    String? error ;

    LevelsDataResponse({this.message, this.page, this.levels,this.error});

    LevelsDataResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        page = json["page"];
        levels = json["levels"] == null ? null : (json["levels"] as List).map((e) => Levels.fromJson(e)).toList();
        error = '';
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["message"] = message;
        data["page"] = page;
        if(levels != null) {
            data["levels"] = levels?.map((e) => e.toJson()).toList();
        }
        return data;
    }
}

class Levels {
    Image? image;
    String? id;
    String? subjectId;
    String? subjectName;
    String? levelName;
    int? scoreOfLevel;
    int? v;

    Levels({this.image, this.id, this.subjectId, this.subjectName, this.levelName, this.scoreOfLevel, this.v});

    Levels.fromJson(Map<String, dynamic> json) {
        image = json["image"] == null ? null : Image.fromJson(json["image"]);
        id = json["_id"];
        subjectId = json["subjectId"];
        subjectName = json["subjectName"];
        levelName = json["levelName"];
        scoreOfLevel = json["scoreOfLevel"];
        v = json["__v"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(image != null) {
            data["image"] = image?.toJson();
        }
        data["_id"] = id;
        data["subjectId"] = subjectId;
        data["subjectName"] = subjectName;
        data["levelName"] = levelName;
        data["scoreOfLevel"] = scoreOfLevel;
        data["__v"] = v;
        return data;
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
        final Map<String, dynamic> data = <String, dynamic>{};
        data["public_id"] = publicId;
        data["secure_url"] = secureUrl;
        return data;
    }
}