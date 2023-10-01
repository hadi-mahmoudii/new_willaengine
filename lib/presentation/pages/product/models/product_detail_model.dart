
class ProductDetailModel {
  int? id;
  int? businessId;
  int? userId;
  int? branchId;
  int? productId;
  String? name;
  dynamic maxQuantityInCart;
  String? nameEn;
  int? status;
  Product? product;
  List<StoreProductVariations>? storeProductVariations;
  List<dynamic>? options;
  String? scheme;
  dynamic modifiedAt;
  String? createdAt;
  String? updatedAt;

  ProductDetailModel({
    this.id,
    this.businessId,
    this.userId,
    this.branchId,
    this.productId,
    this.name,
    this.maxQuantityInCart,
    this.nameEn,
    this.status,
    this.product,
    this.storeProductVariations,
    this.options,
    this.scheme,
    this.modifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    businessId = json['business_id'] as int?;
    userId = json['user_id'] as int?;
    branchId = json['branch_id'] as int?;
    productId = json['product_id'] as int?;
    name = json['name'] as String?;
    maxQuantityInCart = json['max_quantity_in_cart'];
    nameEn = json['name_en'] as String?;
    status = json['status'] as int?;
    product = (json['product'] as Map<String,dynamic>?) != null ? Product.fromJson(json['product'] as Map<String,dynamic>) : null;
    storeProductVariations = (json['store_product_variations'] as List?)?.map((dynamic e) => StoreProductVariations.fromJson(e as Map<String,dynamic>)).toList();
    options = json['options'] as List?;
    scheme = json['scheme'] as String?;
    modifiedAt = json['modified_at'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['business_id'] = businessId;
    json['user_id'] = userId;
    json['branch_id'] = branchId;
    json['product_id'] = productId;
    json['name'] = name;
    json['max_quantity_in_cart'] = maxQuantityInCart;
    json['name_en'] = nameEn;
    json['status'] = status;
    json['product'] = product?.toJson();
    json['store_product_variations'] = storeProductVariations?.map((e) => e.toJson()).toList();
    json['options'] = options;
    json['scheme'] = scheme;
    json['modified_at'] = modifiedAt;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class Product {
  String? scheme;
  int? productCategoryId;
  int? id;
  String? name;
  String? nameEn;
  dynamic brandId;
  String? description;
  dynamic expertCheck;
  dynamic digitalAssetBucket;
  dynamic digitalAssetDriver;
  dynamic digitalAssetObject;
  int? languageCount;
  bool? owner;
  dynamic metaTag;
  String? thumbnail;
  List<Media>? media;
  String? mainImage;
  dynamic brand;
  ProductCategory? productCategory;
  Attributes? attributes;
  dynamic formDetail;
  List<dynamic>? faqs;
  dynamic attributeOptionsCount;
  dynamic summary;

  Product({
    this.scheme,
    this.productCategoryId,
    this.id,
    this.name,
    this.nameEn,
    this.brandId,
    this.description,
    this.expertCheck,
    this.digitalAssetBucket,
    this.digitalAssetDriver,
    this.digitalAssetObject,
    this.languageCount,
    this.owner,
    this.metaTag,
    this.thumbnail,
    this.media,
    this.mainImage,
    this.brand,
    this.productCategory,
    this.attributes,
    this.formDetail,
    this.faqs,
    this.attributeOptionsCount,
    this.summary,
  });

  Product.fromJson(Map<String, dynamic> json) {
    scheme = json['scheme'] as String?;
    productCategoryId = json['product_category_id'] as int?;
    id = json['id'] as int?;
    name = json['name'] as String?;
    nameEn = json['name_en'] as String?;
    brandId = json['brand_id'];
    description = json['description'] as String?;
    expertCheck = json['expert_check'];
    digitalAssetBucket = json['digital_asset_bucket'];
    digitalAssetDriver = json['digital_asset_driver'];
    digitalAssetObject = json['digital_asset_object'];
    languageCount = json['language_count'] as int?;
    owner = json['owner'] as bool?;
    metaTag = json['meta_tag'];
    thumbnail = json['thumbnail'] as String?;
    media = (json['media'] as List?)?.map((dynamic e) => Media.fromJson(e as Map<String,dynamic>)).toList();
    mainImage = json['main_image'] as String?;
    brand = json['brand'];
    productCategory = (json['product_category'] as Map<String,dynamic>?) != null ? ProductCategory.fromJson(json['product_category'] as Map<String,dynamic>) : null;
    attributes = (json['attributes'] as Map<String,dynamic>?) != null ? Attributes.fromJson(json['attributes'] as Map<String,dynamic>) : null;
    formDetail = json['form_detail'];
    faqs = json['faqs'] as List?;
    attributeOptionsCount = json['attribute_options_count'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['scheme'] = scheme;
    json['product_category_id'] = productCategoryId;
    json['id'] = id;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['brand_id'] = brandId;
    json['description'] = description;
    json['expert_check'] = expertCheck;
    json['digital_asset_bucket'] = digitalAssetBucket;
    json['digital_asset_driver'] = digitalAssetDriver;
    json['digital_asset_object'] = digitalAssetObject;
    json['language_count'] = languageCount;
    json['owner'] = owner;
    json['meta_tag'] = metaTag;
    json['thumbnail'] = thumbnail;
    json['media'] = media?.map((e) => e.toJson()).toList();
    json['main_image'] = mainImage;
    json['brand'] = brand;
    json['product_category'] = productCategory?.toJson();
    json['attributes'] = attributes?.toJson();
    json['form_detail'] = formDetail;
    json['faqs'] = faqs;
    json['attribute_options_count'] = attributeOptionsCount;
    json['summary'] = summary;
    return json;
  }
}

class Media {
  int? id;
  String? collectionName;
  String? thumbnail;
  String? image;
  String? mimeType;
  String? fileName;
  int? size;

  Media({
    this.id,
    this.collectionName,
    this.thumbnail,
    this.image,
    this.mimeType,
    this.fileName,
    this.size,
  });

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    collectionName = json['collection_name'] as String?;
    thumbnail = json['thumbnail'] as String?;
    image = json['image'] as String?;
    mimeType = json['mime_type'] as String?;
    fileName = json['file_name'] as String?;
    size = json['size'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['collection_name'] = collectionName;
    json['thumbnail'] = thumbnail;
    json['image'] = image;
    json['mime_type'] = mimeType;
    json['file_name'] = fileName;
    json['size'] = size;
    return json;
  }
}

class ProductCategory {
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
  String? thumbnail;
  String? mainImage;
  int? languageCount;
  dynamic costGroupId;
  String? priceRange;
  int? status;

  ProductCategory({
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
    this.thumbnail,
    this.mainImage,
    this.languageCount,
    this.costGroupId,
    this.priceRange,
    this.status,
  });

  ProductCategory.fromJson(Map<String, dynamic> json) {
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
    thumbnail = json['thumbnail'] as String?;
    mainImage = json['main_image'] as String?;
    languageCount = json['language_count'] as int?;
    costGroupId = json['cost_group_id'];
    priceRange = json['price_range'] as String?;
    status = json['status'] as int?;
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
    json['thumbnail'] = thumbnail;
    json['main_image'] = mainImage;
    json['language_count'] = languageCount;
    json['cost_group_id'] = costGroupId;
    json['price_range'] = priceRange;
    json['status'] = status;
    return json;
  }
}

class Attributes {
  List<dynamic>? options;
  List<Variations>? variations;

  Attributes({
    this.options,
    this.variations,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    options = json['options'] as List?;
    variations = (json['variations'] as List?)?.map((dynamic e) => Variations.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['options'] = options;
    json['variations'] = variations?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Variations {
  int? id;
  String? scheme;
  int? languageCount;
  String? name;
  String? nameEn;
  int? parentId;
  dynamic optionType;
  String? attributeType;
  bool? freeRegistration;
  List<Values>? values;

  Variations({
    this.id,
    this.scheme,
    this.languageCount,
    this.name,
    this.nameEn,
    this.parentId,
    this.optionType,
    this.attributeType,
    this.freeRegistration,
    this.values,
  });

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    scheme = json['scheme'] as String?;
    languageCount = json['language_count'] as int?;
    name = json['name'] as String?;
    nameEn = json['name_en'] as String?;
    parentId = json['parent_id'] as int?;
    optionType = json['option_type'];
    attributeType = json['attribute_type'] as String?;
    freeRegistration = json['free_registration'] as bool?;
    values = (json['values'] as List?)?.map((dynamic e) => Values.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['scheme'] = scheme;
    json['language_count'] = languageCount;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['parent_id'] = parentId;
    json['option_type'] = optionType;
    json['attribute_type'] = attributeType;
    json['free_registration'] = freeRegistration;
    json['values'] = values?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Values {
  int? id;
  String? scheme;
  int? languageCount;
  String? name;
  dynamic value;
  int? parentId;
  String? media;

  Values({
    this.id,
    this.scheme,
    this.languageCount,
    this.name,
    this.value,
    this.parentId,
    this.media,
  });

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    scheme = json['scheme'] as String?;
    languageCount = json['language_count'] as int?;
    name = json['name'] as String?;
    value = json['value'];
    parentId = json['parent_id'] as int?;
    media = json['media'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['scheme'] = scheme;
    json['language_count'] = languageCount;
    json['name'] = name;
    json['value'] = value;
    json['parent_id'] = parentId;
    json['media'] = media;
    return json;
  }
}

class StoreProductVariations {
  int? id;
  dynamic branchId;
  int? storeProductId;
  int? stock;
  int? price;
  int? oldPrice;
  int? corporatePrice;
  dynamic preparation;
  List<AttributeValues>? attributeValues;
  String? createdAt;
  String? updatedAt;

  StoreProductVariations({
    this.id,
    this.branchId,
    this.storeProductId,
    this.stock,
    this.price,
    this.oldPrice,
    this.corporatePrice,
    this.preparation,
    this.attributeValues,
    this.createdAt,
    this.updatedAt,
  });

  StoreProductVariations.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    branchId = json['branch_id'];
    storeProductId = json['store_product_id'] as int?;
    stock = json['stock'] as int?;
    price = json['price'] as int?;
    oldPrice = json['old_price'] as int?;
    corporatePrice = json['corporate_price'] as int?;
    preparation = json['preparation'];
    attributeValues = (json['attribute_values'] as List?)?.map((dynamic e) => AttributeValues.fromJson(e as Map<String,dynamic>)).toList();
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['branch_id'] = branchId;
    json['store_product_id'] = storeProductId;
    json['stock'] = stock;
    json['price'] = price;
    json['old_price'] = oldPrice;
    json['corporate_price'] = corporatePrice;
    json['preparation'] = preparation;
    json['attribute_values'] = attributeValues?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class AttributeValues {
  int? id;
  int? storeProductVariationId;
  int? attributeId;
  int? attributeValueId;
  Attribute? attribute;
  AttributeValue? attributeValue;

  AttributeValues({
    this.id,
    this.storeProductVariationId,
    this.attributeId,
    this.attributeValueId,
    this.attribute,
    this.attributeValue,
  });

  AttributeValues.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    storeProductVariationId = json['store_product_variation_id'] as int?;
    attributeId = json['attribute_id'] as int?;
    attributeValueId = json['attribute_value_id'] as int?;
    attribute = (json['attribute'] as Map<String,dynamic>?) != null ? Attribute.fromJson(json['attribute'] as Map<String,dynamic>) : null;
    attributeValue = (json['attribute_value'] as Map<String,dynamic>?) != null ? AttributeValue.fromJson(json['attribute_value'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['store_product_variation_id'] = storeProductVariationId;
    json['attribute_id'] = attributeId;
    json['attribute_value_id'] = attributeValueId;
    json['attribute'] = attribute?.toJson();
    json['attribute_value'] = attributeValue?.toJson();
    return json;
  }
}

class Attribute {
  int? id;
  String? scheme;
  int? languageCount;
  String? name;
  String? nameEn;
  int? parentId;
  dynamic optionType;
  String? attributeType;
  bool? freeRegistration;

  Attribute({
    this.id,
    this.scheme,
    this.languageCount,
    this.name,
    this.nameEn,
    this.parentId,
    this.optionType,
    this.attributeType,
    this.freeRegistration,
  });

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    scheme = json['scheme'] as String?;
    languageCount = json['language_count'] as int?;
    name = json['name'] as String?;
    nameEn = json['name_en'] as String?;
    parentId = json['parent_id'] as int?;
    optionType = json['option_type'];
    attributeType = json['attribute_type'] as String?;
    freeRegistration = json['free_registration'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['scheme'] = scheme;
    json['language_count'] = languageCount;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['parent_id'] = parentId;
    json['option_type'] = optionType;
    json['attribute_type'] = attributeType;
    json['free_registration'] = freeRegistration;
    return json;
  }
}

class AttributeValue {
  int? id;
  String? scheme;
  int? languageCount;
  String? name;
  String? value;
  int? parentId;
  String? media;

  AttributeValue({
    this.id,
    this.scheme,
    this.languageCount,
    this.name,
    this.value,
    this.parentId,
    this.media,
  });

  AttributeValue.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    scheme = json['scheme'] as String?;
    languageCount = json['language_count'] as int?;
    name = json['name'] as String?;
    value = json['value'] as String?;
    parentId = json['parent_id'] as int?;
    media = json['media'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['scheme'] = scheme;
    json['language_count'] = languageCount;
    json['name'] = name;
    json['value'] = value;
    json['parent_id'] = parentId;
    json['media'] = media;
    return json;
  }
}

class AvailableVariationAttributes {
  List<CategoryOne>? categoryOne;
  List<Guarantee>? guarantee;

  AvailableVariationAttributes({
    this.categoryOne,
    this.guarantee,
  });

  AvailableVariationAttributes.fromJson(Map<String, dynamic> json) {
    categoryOne = (json['category one'] as List?)?.map((dynamic e) => CategoryOne.fromJson(e as Map<String,dynamic>)).toList();
    guarantee = (json['guarantee'] as List?)?.map((dynamic e) => Guarantee.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['category one'] = categoryOne?.map((e) => e.toJson()).toList();
    json['guarantee'] = guarantee?.map((e) => e.toJson()).toList();
    return json;
  }
}

class CategoryOne {
  int? id;
  int? storeProductVariationId;
  int? attributeId;
  int? attributeValueId;
  Attribute? attribute;
  AttributeValue? attributeValue;

  CategoryOne({
    this.id,
    this.storeProductVariationId,
    this.attributeId,
    this.attributeValueId,
    this.attribute,
    this.attributeValue,
  });

  CategoryOne.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    storeProductVariationId = json['store_product_variation_id'] as int?;
    attributeId = json['attribute_id'] as int?;
    attributeValueId = json['attribute_value_id'] as int?;
    attribute = (json['attribute'] as Map<String,dynamic>?) != null ? Attribute.fromJson(json['attribute'] as Map<String,dynamic>) : null;
    attributeValue = (json['attribute_value'] as Map<String,dynamic>?) != null ? AttributeValue.fromJson(json['attribute_value'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['store_product_variation_id'] = storeProductVariationId;
    json['attribute_id'] = attributeId;
    json['attribute_value_id'] = attributeValueId;
    json['attribute'] = attribute?.toJson();
    json['attribute_value'] = attributeValue?.toJson();
    return json;
  }
}



class Guarantee {
  int? id;
  int? storeProductVariationId;
  int? attributeId;
  int? attributeValueId;
  Attribute? attribute;
  AttributeValue? attributeValue;

  Guarantee({
    this.id,
    this.storeProductVariationId,
    this.attributeId,
    this.attributeValueId,
    this.attribute,
    this.attributeValue,
  });

  Guarantee.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    storeProductVariationId = json['store_product_variation_id'] as int?;
    attributeId = json['attribute_id'] as int?;
    attributeValueId = json['attribute_value_id'] as int?;
    attribute = (json['attribute'] as Map<String,dynamic>?) != null ? Attribute.fromJson(json['attribute'] as Map<String,dynamic>) : null;
    attributeValue = (json['attribute_value'] as Map<String,dynamic>?) != null ? AttributeValue.fromJson(json['attribute_value'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['store_product_variation_id'] = storeProductVariationId;
    json['attribute_id'] = attributeId;
    json['attribute_value_id'] = attributeValueId;
    json['attribute'] = attribute?.toJson();
    json['attribute_value'] = attributeValue?.toJson();
    return json;
  }
}
