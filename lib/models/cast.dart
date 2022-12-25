class CastData {
  List<Cast>? cast;

  CastData({this.cast});

  CastData.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(Cast.fromJson(v));
      });
    }
  }
}

class Cast {
  String? name;
  String? profilePath;
  int? gender;

  Cast({
    this.name,
    this.profilePath,
    this.gender,
  });

  Cast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePath = json['profile_path'];
    gender = json['gender'];
  }
}
