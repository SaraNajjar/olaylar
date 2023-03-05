class TCategory {
  bool? status;
  int? code;
  String? message;
  List<Items>? items;

  TCategory({this.status, this.code, this.message, this.items});

  TCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? titleAr;
  String? titleEn;
  String? titleTr;
  String? image;
  String? descriptionAr;
  String? descriptionEn;
  String? descriptionTr;
  String? colour;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;

  Items(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.titleTr,
        this.image,
        this.descriptionAr,
        this.descriptionEn,
        this.descriptionTr,
        this.colour,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.description});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    titleTr = json['title_tr'];
    image = json['image'];
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
    descriptionTr = json['description_tr'];
    colour = json['colour'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['title_tr'] = this.titleTr;
    data['image'] = this.image;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    data['description_tr'] = this.descriptionTr;
    data['colour'] = this.colour;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}