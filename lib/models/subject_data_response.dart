
class SubjectDataResponse {
    String? message;
    int? page;
    List<Subjects>? subjects;
    String? error='';

    SubjectDataResponse({this.message, this.page, this.subjects,this.error});

    SubjectDataResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        page = json["page"];
        subjects = json["subjects"] == null ? null : (json["subjects"] as List).map((e) => Subjects.fromJson(e)).toList();
        error ='';
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["message"] = message;
        data["page"] = page;
        if(subjects != null) {
            data["subjects"] = subjects?.map((e) => e.toJson()).toList();
        }
        return data;
    }
}

class Subjects {
    Image? image;
    String? id;
    String? name;
    int? v;

    Subjects({this.image, this.id, this.name, this.v});

    Subjects.fromJson(Map<String, dynamic> json) {
        image = json["image"] == null ? null : Image.fromJson(json["image"]);
        id = json["_id"];
        name = json["name"];
        v = json["__v"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        if(image != null) {
            data["image"] = image?.toJson();
        }
        data["_id"] = id;
        data["name"] = name;
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