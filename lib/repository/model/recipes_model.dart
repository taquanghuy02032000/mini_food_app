class RecipesTotalResponse {
  int? offset;
  int? number;
  List<RecipeModel>? results;
  int? totalResults;

  RecipesTotalResponse({this.offset, this.number, this.results, this.totalResults});

  RecipesTotalResponse.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    number = json['number'];
    if (json['results'] != null) {
      results = <RecipeModel>[];
      json['results'].forEach((v) {
        results!.add(RecipeModel.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['number'] = number;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = totalResults;
    return data;
  }
}

class RecipeModel {
  int? id;
  String? title;
  String? image;
  String? imageType;

  RecipeModel({this.id, this.title, this.image, this.imageType});

  RecipeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['imageType'] = imageType;
    return data;
  }
}
