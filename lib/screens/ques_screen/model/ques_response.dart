
class QuesResponse {
    String? message;
    List<Ques>? ques;
    String? error; 

    QuesResponse({this.message, this.ques,this.error});

    QuesResponse.fromJson(Map<String, dynamic> json) {
        message = json["message"];
        ques = json["ques"] == null ? null : (json["ques"] as List).map((e) => Ques.fromJson(e)).toList();
    }

   
}

class Ques {
    String? id;
    String? lessonName;
    String? quesName;
    List<String>? content;
    String? answer;
    int? score;
    String? titleOfQues;
    List<Images>? images;
    int? v;

    Ques({this.id, this.lessonName, this.quesName, this.content, this.answer, this.score, this.titleOfQues, this.images, this.v});

    Ques.fromJson(Map<String, dynamic> json) {
        id = json["_id"];
        lessonName = json["lessonName"];
        quesName = json["quesName"];
        content = json["content"] == null ? null : List<String>.from(json["content"]);
        answer = json["answer"];
        score = (json["score"] as num).toInt();
        titleOfQues = json["titleOfQues"];
        images = json["images"] == null ? null : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
        v = (json["__v"] as num).toInt();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["_id"] = id;
        _data["lessonName"] = lessonName;
        _data["quesName"] = quesName;
        if(content != null) {
            _data["content"] = content;
        }
        _data["answer"] = answer;
        _data["score"] = score;
        _data["titleOfQues"] = titleOfQues;
        if(images != null) {
            _data["images"] = images?.map((e) => e.toJson()).toList();
        }
        _data["__v"] = v;
        return _data;
    }
}

class Images {
    String? publicId;
    String? secureUrl;
    String? id;

    Images({this.publicId, this.secureUrl, this.id});

    Images.fromJson(Map<String, dynamic> json) {
        publicId = json["public_id"];
        secureUrl = json["secure_url"];
        id = json["_id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["public_id"] = publicId;
        _data["secure_url"] = secureUrl;
        _data["_id"] = id;
        return _data;
    }
}