class StoreProduct {
  List<ProductParent>? data;
  Links? links;
  Meta? meta;

  StoreProduct({
    this.data,
    this.links,
    this.meta,
  });

  StoreProduct.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List?)?.map((dynamic e) => ProductParent.fromJson(e as Map<String,dynamic>)).toList();
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['links'] = links?.toJson();
    json['meta'] = meta?.toJson();
    return json;
  }
}

class ProductParent {
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
  String? modifiedAt;
  String? createdAt;
  String? updatedAt;

  ProductParent({
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

  ProductParent.fromJson(Map<String, dynamic> json) {
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
    modifiedAt = json['modified_at'] as String?;
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
  List<dynamic>? media;
  String? mainImage;
  dynamic attributeOptionsCount;
  ProductCategory? productCategory;
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
    this.attributeOptionsCount,
    this.productCategory,
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
    media = json['media'] as List?;
    mainImage = json['main_image'] as String?;
    attributeOptionsCount = json['attribute_options_count'];
    summary = json['summary'];
    productCategory = (json['product_category'] as Map<String,dynamic>?) != null ? ProductCategory.fromJson(json['product_category'] as Map<String,dynamic>) : null;
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
    json['media'] = media;
    json['main_image'] = mainImage;
    json['attribute_options_count'] = attributeOptionsCount;
    json['summary'] = summary;
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
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'] as String?;
    last = json['last'] as String?;
    prev = json['prev'];
    next = json['next'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['first'] = first;
    json['last'] = last;
    json['prev'] = prev;
    json['next'] = next;
    return json;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] as int?;
    from = json['from'] as int?;
    lastPage = json['last_page'] as int?;
    links = (json['links'] as List?)?.map((dynamic e) => Links.fromJson(e as Map<String,dynamic>)).toList();
    path = json['path'] as String?;
    perPage = json['per_page'] as int?;
    to = json['to'] as int?;
    total = json['total'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current_page'] = currentPage;
    json['from'] = from;
    json['last_page'] = lastPage;
    json['links'] = links?.map((e) => e.toJson()).toList();
    json['path'] = path;
    json['per_page'] = perPage;
    json['to'] = to;
    json['total'] = total;
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