

class CategoryModel {
  int? id;
  String? name;
  String? nameEn;
  String? slug;
  dynamic expertCheck;
  dynamic metaTag;
  String? scheme;
  bool? owner;
  dynamic calculationMethodId;
  dynamic calculationMethodStep;
  dynamic calculationMethodValue;
  String? createdAt;
  dynamic parentId;
  dynamic parent;
  String? thumbnail;
  String? mainImage;
  int? languageCount;
  int? childrenCount;
  List<String>? tags;
  List<dynamic>? brands;
  List<dynamic>? selfAndParentBrands;
  dynamic costGroupId;
  String? priceRange;
  int? status;
  List<dynamic>? productSummary;

  CategoryModel({
    this.id,
    this.name,
    this.nameEn,
    this.slug,
    this.expertCheck,
    this.metaTag,
    this.scheme,
    this.owner,
    this.calculationMethodId,
    this.calculationMethodStep,
    this.calculationMethodValue,
    this.createdAt,
    this.parentId,
    this.parent,
    this.thumbnail,
    this.mainImage,
    this.languageCount,
    this.childrenCount,
    this.tags,
    this.brands,
    this.selfAndParentBrands,
    this.costGroupId,
    this.priceRange,
    this.status,
    this.productSummary,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    nameEn = json['name_en'] as String?;
    slug = json['slug'] as String?;
    expertCheck = json['expert_check'];
    metaTag = json['meta_tag'];
    scheme = json['scheme'] as String?;
    owner = json['owner'] as bool?;
    calculationMethodId = json['calculation_method_id'];
    calculationMethodStep = json['calculation_method_step'];
    calculationMethodValue = json['calculation_method_value'];
    createdAt = json['created_at'] as String?;
    parentId = json['parent_id'];
    parent = json['parent'];
    thumbnail = json['thumbnail'] as String?;
    mainImage = json['main_image'] as String?;
    languageCount = json['language_count'] as int?;
    childrenCount = json['children_count'] as int?;
    tags = (json['tags'] as List?)?.map((dynamic e) => e as String).toList();
    brands = json['brands'] as List?;
    selfAndParentBrands = json['selfAndParentBrands'] as List?;
    costGroupId = json['cost_group_id'];
    priceRange = json['price_range'] as String?;
    status = json['status'] as int?;
    productSummary = json['product_summary'] as List?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['slug'] = slug;
    json['expert_check'] = expertCheck;
    json['meta_tag'] = metaTag;
    json['scheme'] = scheme;
    json['owner'] = owner;
    json['calculation_method_id'] = calculationMethodId;
    json['calculation_method_step'] = calculationMethodStep;
    json['calculation_method_value'] = calculationMethodValue;
    json['created_at'] = createdAt;
    json['parent_id'] = parentId;
    json['parent'] = parent;
    json['thumbnail'] = thumbnail;
    json['main_image'] = mainImage;
    json['language_count'] = languageCount;
    json['children_count'] = childrenCount;
    json['tags'] = tags;
    json['brands'] = brands;
    json['selfAndParentBrands'] = selfAndParentBrands;
    json['cost_group_id'] = costGroupId;
    json['price_range'] = priceRange;
    json['status'] = status;
    json['product_summary'] = productSummary;
    return json;
  }
}