class Recommended {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  List<Products>? _products;

  Recommended(
      {int? totalSize, int? typeId, int? offset, List<Products>? products}) {
    if (totalSize != null) {
      this._totalSize = totalSize;
    }
    if (typeId != null) {
      this._typeId = typeId;
    }
    if (offset != null) {
      this._offset = offset;
    }
    if (products != null) {
      this._products = products;
    }
  }

  int? get totalSize => _totalSize;
  set totalSize(int? totalSize) => _totalSize = totalSize;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;

  Recommended.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(Products.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['total_size'] = this._totalSize;
  //   data['type_id'] = this._typeId;
  //   data['offset'] = this._offset;
  //   if (this._products != null) {
  //     data['products'] = this._products!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Products {
  int? _id;
  String? _name;
  String? _description;
  int? _price;
  int? _stars;
  String? _img;
  String? _location;
  String? _createdAt;
  String? _updatedAt;
  int? _typeId;

  Products(
      {int? id,
        String? name,
        String? description,
        int? price,
        int? stars,
        String? img,
        String? location,
        String? createdAt,
        String? updatedAt,
        int? typeId}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (stars != null) {
      this._stars = stars;
    }
    if (img != null) {
      this._img = img;
    }
    if (location != null) {
      this._location = location;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (typeId != null) {
      this._typeId = typeId;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get price => _price;
  set price(int? price) => _price = price;
  int? get stars => _stars;
  set stars(int? stars) => _stars = stars;
  String? get img => _img;
  set img(String? img) => _img = img;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get typeId => _typeId;
  set typeId(int? typeId) => _typeId = typeId;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stars = json['stars'];
    _img = json['img'];
    _location = json['location'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _typeId = json['type_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this._id;
  //   data['name'] = this._name;
  //   data['description'] = this._description;
  //   data['price'] = this._price;
  //   data['stars'] = this._stars;
  //   data['img'] = this._img;
  //   data['location'] = this._location;
  //   data['created_at'] = this._createdAt;
  //   data['updated_at'] = this._updatedAt;
  //   data['type_id'] = this._typeId;
  //   return data;
  // }
}