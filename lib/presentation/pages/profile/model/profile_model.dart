class ProfileModel {
  ProfileModel({
     this.id,
    required this.scheme,
    required this.name,
    required this.isUser,
    required this.firstName,
    required this.lastName,
    required this.isOwner,
    this.nameEn,
    this.birthday,
    this.nationalCode,
    this.email,
    required this.cellNumber,
    this.telegram,
    this.instagram,
    required this.createdAt,
    required this.departments,
    required this.addresses,
    required this.phones,
    this.cityId,
    this.referral,
  });
  late final int? id;
  late final String scheme;
  late final String name;
  late final bool isUser;
  late final String firstName;
  late final String lastName;
  late final bool isOwner;
  late final Null nameEn;
  late final String? birthday;
  late final Null nationalCode;
  late final String? email;
  late final String cellNumber;
  late final Null telegram;
  late final Null instagram;
  late final String createdAt;
  late final List<dynamic> departments;
  late final List<dynamic> addresses;
  late final List<dynamic> phones;
  late final Null cityId;
  late final Null referral;

  ProfileModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    scheme = json['scheme'];
    name = json['name'];
    isUser = json['is_user'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isOwner = json['is_owner'];
    nameEn = null;
    birthday = null;
    nationalCode = null;
    email = null;
    cellNumber = json['cell_number'];
    telegram = null;
    instagram = null;
    createdAt = json['created_at'];
    departments = List.castFrom<dynamic, dynamic>(json['departments']);
    addresses = List.castFrom<dynamic, dynamic>(json['addresses']);
    phones = List.castFrom<dynamic, dynamic>(json['phones']);
    cityId = null;
    referral = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['scheme'] = scheme;
    _data['name'] = name;
    _data['is_user'] = isUser;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['is_owner'] = isOwner;
    _data['name_en'] = nameEn;
    _data['birthday'] = birthday;
    _data['national_code'] = nationalCode;
    _data['email'] = email;
    _data['cell_number'] = cellNumber;
    _data['telegram'] = telegram;
    _data['instagram'] = instagram;
    _data['created_at'] = createdAt;
    _data['departments'] = departments;
    _data['addresses'] = addresses;
    _data['phones'] = phones;
    _data['city_id'] = cityId;
    _data['referral'] = referral;
    return _data;
  }
}