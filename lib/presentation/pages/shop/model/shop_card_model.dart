class ShopCardModel {
  Data? data;
  Message? message;

  ShopCardModel({
    this.data,
    this.message,
  });

  ShopCardModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as Map<String, dynamic>?) != null ? Data.fromJson(json['data'] as Map<String, dynamic>) : null;
    message = (json['message'] as Map<String, dynamic>?) != null ? Message.fromJson(json['message'] as Map<String, dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = data?.toJson();
    json['message'] = message?.toJson();
    return json;
  }
}

class Data {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic giftCardCode;
  dynamic price;
  List<ShoppingCartItems>? shoppingCartItems;
  String? deliveryType;
  String? orderType;

  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.giftCardCode,
    this.price,
    this.shoppingCartItems,
    this.deliveryType,
    this.orderType,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    giftCardCode = json['gift_card_code'];
    price = json['price'];
    shoppingCartItems = (json['shopping_cart_items'] as List?)?.map((dynamic e) => ShoppingCartItems.fromJson(e as Map<String, dynamic>)).toList();
    deliveryType = json['delivery_type'] as String?;
    orderType = json['order_type'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['gift_card_code'] = giftCardCode;
    json['price'] = price;
    json['shopping_cart_items'] = shoppingCartItems?.map((e) => e.toJson()).toList();
    json['delivery_type'] = deliveryType;
    json['order_type'] = orderType;
    return json;
  }
}

class ShoppingCartItems {
  int? id;
  int? shoppingCartId;
  StoreProductVariation? storeProductVariation;
  int? quantity;
  dynamic price;
  dynamic oldPrice;
  List<dynamic>? options;
  int? costGroupId;

  ShoppingCartItems({
    this.id,
    this.shoppingCartId,
    this.storeProductVariation,
    this.quantity,
    this.price,
    this.oldPrice,
    this.options,
    this.costGroupId,
  });

  ShoppingCartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    shoppingCartId = json['shopping_cart_id'] as int?;
    storeProductVariation = (json['store_product_variation'] as Map<String, dynamic>?) != null
        ? StoreProductVariation.fromJson(json['store_product_variation'] as Map<String, dynamic>)
        : null;
    quantity = json['quantity'] as int?;
    price = json['price'];
    oldPrice = json['old_price'];
    options = json['options'] as List?;
    costGroupId = json['cost_group_id'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['shopping_cart_id'] = shoppingCartId;
    json['store_product_variation'] = storeProductVariation?.toJson();
    json['quantity'] = quantity;
    json['price'] = price;
    json['old_price'] = oldPrice;
    json['options'] = options;
    json['cost_group_id'] = costGroupId;
    return json;
  }
}

class StoreProductVariation {
  int? id;
  dynamic branchId;
  int? storeProductId;
  int? stock;
  int? price;
  int? oldPrice;
  int? corporatePrice;
  dynamic preparation;
  StoreProduct? storeProduct;
  List<dynamic>? wholesalePrice;
  List<AttributeValues>? attributeValues;
  String? createdAt;
  String? updatedAt;

  StoreProductVariation({
    this.id,
    this.branchId,
    this.storeProductId,
    this.stock,
    this.price,
    this.oldPrice,
    this.corporatePrice,
    this.preparation,
    this.storeProduct,
    this.wholesalePrice,
    this.attributeValues,
    this.createdAt,
    this.updatedAt,
  });

  StoreProductVariation.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    branchId = json['branch_id'];
    storeProductId = json['store_product_id'] as int?;
    stock = json['stock'] as int?;
    price = json['price'] as int?;
    oldPrice = json['old_price'] as int?;
    corporatePrice = json['corporate_price'] as int?;
    preparation = json['preparation'];
    storeProduct =
        (json['store_product'] as Map<String, dynamic>?) != null ? StoreProduct.fromJson(json['store_product'] as Map<String, dynamic>) : null;
    wholesalePrice = json['wholesale_price'] as List?;
    attributeValues = (json['attribute_values'] as List?)?.map((dynamic e) => AttributeValues.fromJson(e as Map<String, dynamic>)).toList();
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
    json['store_product'] = storeProduct?.toJson();
    json['wholesale_price'] = wholesalePrice;
    json['attribute_values'] = attributeValues?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }
}

class StoreProduct {
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
  String? scheme;
  String? modifiedAt;
  String? createdAt;
  String? updatedAt;

  StoreProduct({
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
    this.scheme,
    this.modifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  StoreProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    businessId = json['business_id'] as int?;
    userId = json['user_id'] as int?;
    branchId = json['branch_id'] as int?;
    productId = json['product_id'] as int?;
    name = json['name'] as String?;
    maxQuantityInCart = json['max_quantity_in_cart'];
    nameEn = json['name_en'] as String?;
    status = json['status'] as int?;
    product = (json['product'] as Map<String, dynamic>?) != null ? Product.fromJson(json['product'] as Map<String, dynamic>) : null;
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
    media = (json['media'] as List?)?.map((dynamic e) => Media.fromJson(e as Map<String, dynamic>)).toList();
    mainImage = json['main_image'] as String?;
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
    attribute = (json['attribute'] as Map<String, dynamic>?) != null ? Attribute.fromJson(json['attribute'] as Map<String, dynamic>) : null;
    attributeValue =
        (json['attribute_value'] as Map<String, dynamic>?) != null ? AttributeValue.fromJson(json['attribute_value'] as Map<String, dynamic>) : null;
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

class Message {
  String? title;
  String? content;

  Message({
    this.title,
    this.content,
  });

  Message.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    content = json['content'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['content'] = content;
    return json;
  }
}
