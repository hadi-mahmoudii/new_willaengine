class SliderParent {
  List<SliderModel>? data;

  SliderParent({
    this.data,
  });

  SliderParent.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List?)?.map((dynamic e) => SliderModel.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class SliderModel {
  int? id;
  int? modelId;
  String? modelType;
  String? module;
  String? size;
  String? type;
  Model? model;
  bool? owner;
  String? mainImage;
  String? thumbnail;
  String? scheme;

  SliderModel({
    this.id,
    this.modelId,
    this.modelType,
    this.module,
    this.size,
    this.type,
    this.model,
    this.owner,
    this.mainImage,
    this.thumbnail,
    this.scheme,
  });

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    modelId = json['model_id'] as int?;
    modelType = json['model_type'] as String?;
    module = json['module'] as String?;
    size = json['size'] as String?;
    type = json['type'] as String?;
    model = (json['model'] != null && json['model'].isNotEmpty) ? (json['model'] as Map<String,dynamic>?) != null ? Model.fromJson(json['model'] as Map<String,dynamic>) : null : null;
    owner = json['owner'] as bool?;
    mainImage = json['main_image'] as String?;
    thumbnail = json['thumbnail'] as String?;
    scheme = json['scheme'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['model_id'] = modelId;
    json['model_type'] = modelType;
    json['module'] = module;
    json['size'] = size;
    json['type'] = type;
    json['model'] = model?.toJson();
    json['owner'] = owner;
    json['main_image'] = mainImage;
    json['thumbnail'] = thumbnail;
    json['scheme'] = scheme;
    return json;
  }
}

class Model {
  int? id;
  String? name;
  String? nameEn;
  String? description;
  dynamic productCode;
  int? userId;
  int? businessId;
  int? productCategoryId;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? translates;
  dynamic brandId;
  String? expertCheck;
  dynamic metaTag;
  dynamic summary;
  dynamic deletedAt;
  dynamic digitalAssetDriver;
  dynamic digitalAssetBucket;
  dynamic digitalAssetObject;

  Model({
    this.id,
    this.name,
    this.nameEn,
    this.description,
    this.productCode,
    this.userId,
    this.businessId,
    this.productCategoryId,
    this.createdAt,
    this.updatedAt,
    this.translates,
    this.brandId,
    this.expertCheck,
    this.metaTag,
    this.summary,
    this.deletedAt,
    this.digitalAssetDriver,
    this.digitalAssetBucket,
    this.digitalAssetObject,
  });

  Model.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    nameEn = json['name_en'] as String?;
    description = json['description'] as String?;
    productCode = json['product_code'];
    userId = json['user_id'] as int?;
    businessId = json['business_id'] as int?;
    productCategoryId = json['product_category_id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    translates = json['translates'] as List?;
    brandId = json['brand_id'];
    expertCheck = json['expert_check'] as String?;
    metaTag = json['meta_tag'];
    summary = json['summary'];
    deletedAt = json['deleted_at'];
    digitalAssetDriver = json['digital_asset_driver'];
    digitalAssetBucket = json['digital_asset_bucket'];
    digitalAssetObject = json['digital_asset_object'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['description'] = description;
    json['product_code'] = productCode;
    json['user_id'] = userId;
    json['business_id'] = businessId;
    json['product_category_id'] = productCategoryId;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['translates'] = translates;
    json['brand_id'] = brandId;
    json['expert_check'] = expertCheck;
    json['meta_tag'] = metaTag;
    json['summary'] = summary;
    json['deleted_at'] = deletedAt;
    json['digital_asset_driver'] = digitalAssetDriver;
    json['digital_asset_bucket'] = digitalAssetBucket;
    json['digital_asset_object'] = digitalAssetObject;
    return json;
  }
}