class SubjectDetails{
  String? imageUrl;
  String? title;
  List<Level>? levelsList;

  SubjectDetails(this.imageUrl,this.title,this.levelsList);
}


class Level{
  String? imageUrl;
  String? levelName;
  String? levelTitle;
  int? score;

  Level(this.imageUrl,this.levelName,this.levelTitle,this.score);
}