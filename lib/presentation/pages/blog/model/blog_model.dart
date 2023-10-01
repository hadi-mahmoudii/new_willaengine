import 'package:willaengine/presentation/pages/Home/models/product_model.dart';

class BlogModel {
  List<Article>? articles;
  Links? links;
  Meta? meta;

  BlogModel({
    this.articles,
    this.links,
    this.meta,
  });

  BlogModel.fromJson(Map<String, dynamic> json) {
    articles = (json['data'] as List?)?.map((dynamic e) => Article.fromJson(e as Map<String,dynamic>)).toList();
    links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null;
    meta = (json['meta'] as Map<String,dynamic>?) != null ? Meta.fromJson(json['meta'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['data'] = articles?.map((e) => e.toJson()).toList();
    json['links'] = links?.toJson();
    json['meta'] = meta?.toJson();
    return json;
  }
}

class Article {
  int? id;
  String? scheme;
  String? title;
  String? abstract;
  String? content;
  bool? owner;
  bool? verified;
  dynamic publishAt;
  String? createdAt;
  String? updatedAt;
  int? articleCategoryId;
  List<ArticleCategories>? articleCategories;
  String? thumbnail;
  String? mainImage;
  List<String>? tags;
  User? user;
  MetaTag? metaTag;
  int? commentsCount;
  int? likesCount;

  Article({
    this.id,
    this.scheme,
    this.title,
    this.abstract,
    this.content,
    this.owner,
    this.verified,
    this.publishAt,
    this.createdAt,
    this.updatedAt,
    this.articleCategoryId,
    this.articleCategories,
    this.thumbnail,
    this.mainImage,
    this.tags,
    this.user,
    this.metaTag,
    this.commentsCount,
    this.likesCount,
  });

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    scheme = json['scheme'] as String?;
    title = json['title'] as String?;
    abstract = json['abstract'] as String?;
    content = json['content'] as String?;
    owner = json['owner'] as bool?;
    verified = json['verified'] as bool?;
    publishAt = json['publish_at'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    articleCategoryId = json['article_category_id'] as int?;
    articleCategories = (json['article_categories'] as List?)?.map((dynamic e) => ArticleCategories.fromJson(e as Map<String,dynamic>)).toList();
    thumbnail = json['thumbnail'] as String?;
    mainImage = json['main_image'] as String?;
    tags = (json['tags'] as List?)?.map((dynamic e) => e as String).toList();
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    metaTag = (json['meta_tag'] as Map<String,dynamic>?) != null ? MetaTag.fromJson(json['meta_tag'] as Map<String,dynamic>) : null;
    commentsCount = json['comments_count'] as int?;
    likesCount = json['likes_count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['scheme'] = scheme;
    json['title'] = title;
    json['abstract'] = abstract;
    json['content'] = content;
    json['owner'] = owner;
    json['verified'] = verified;
    json['publish_at'] = publishAt;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['article_category_id'] = articleCategoryId;
    json['article_categories'] = articleCategories?.map((e) => e.toJson()).toList();
    json['thumbnail'] = thumbnail;
    json['main_image'] = mainImage;
    json['tags'] = tags;
    json['user'] = user?.toJson();
    json['meta_tag'] = metaTag?.toJson();
    json['comments_count'] = commentsCount;
    json['likes_count'] = likesCount;
    return json;
  }
}

class ArticleCategories {
  int? id;
  String? name;
  String? nameEn;
  dynamic slug;
  dynamic createdAt;
  dynamic parentId;
  MetaTag? metaTag;

  ArticleCategories({
    this.id,
    this.name,
    this.nameEn,
    this.slug,
    this.createdAt,
    this.parentId,
    this.metaTag,
  });

  ArticleCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    nameEn = json['name_en'] as String?;
    slug = json['slug'];
    createdAt = json['created_at'];
    parentId = json['parent_id'];
    metaTag = (json['meta_tag'] as Map<String,dynamic>?) != null ? MetaTag.fromJson(json['meta_tag'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['name_en'] = nameEn;
    json['slug'] = slug;
    json['created_at'] = createdAt;
    json['parent_id'] = parentId;
    json['meta_tag'] = metaTag?.toJson();
    return json;
  }
}

class MetaTag {
  dynamic title;
  dynamic content;
  dynamic keyword;
  bool? noIndex;
  dynamic canonical;
  dynamic description;

  MetaTag({
    this.title,
    this.content,
    this.keyword,
    this.noIndex,
    this.canonical,
    this.description,
  });

  MetaTag.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    keyword = json['keyword'];
    noIndex = json['noIndex'] as bool?;
    canonical = json['canonical'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['content'] = content;
    json['keyword'] = keyword;
    json['noIndex'] = noIndex;
    json['canonical'] = canonical;
    json['description'] = description;
    return json;
  }
}

class User {
  int? id;
  String? name;

  User({
    this.id,
    this.name,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}




