
class UnitsDataResponse {
    String? message;
    int? page;
    List<Units>? units;
    String? error;

    UnitsDataResponse({this.message, this.page, this.units,this.error});

    UnitsDataResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        page = json["page"];
        units = json["units"] == null ? null : (json["units"] as List).map((e) => Units.fromJson(e)).toList();
        error = '';
    }   

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["message"] = message;
        data["page"] = page;
        if(units != null) {
            data["units"] = units?.map((e) => e.toJson()).toList();
        }
        return data;
    }
}

class Units {
    Image? image;
    String? id;
    String? subjectId;
    String? subjectName;
    String? levelName;
    String? levelId;
    String? content;
    String? unitName;
    int? v;

    Units({this.image, this.id, this.subjectId, this.subjectName, this.levelName, this.levelId, this.content, this.unitName, this.v});

    Units.fromJson(Map<String, dynamic> json) {
        image = json["image"] == null ? null : Image.fromJson(json["image"]);
        id = json["_id"];
        subjectId = json["subjectId"];
        subjectName = json["subjectName"];
        levelName = json["levelName"];
        levelId = json["levelId"];
        content = json["content"];
        unitName = json["unitName"];
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
        data["levelId"] = levelId;
        data["content"] = content;
        data["unitName"] = unitName;
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