import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/auth/users.dart';

class UserResponse extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<DataUser>? data;
  final SupportUser? support;
  final String? error;

  const UserResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
    this.error,
  });

  factory UserResponse.fromJson(dynamic json) {
    final page = json["page"] as int?;
    final perPage = json["per_page"] as int?;
    final total = json["total"] as int?;
    final totalPages = json["total_pages"] as int?;
    final error = json["error"] as String?;
    final dataTemp = json["data"] as List<dynamic>?;
    final data = dataTemp != null
        ? dataTemp.map((e) => DataUser.fromJson(e)).toList()
        : <DataUser>[];
    final support =
        json["support"] != null ? SupportUser.fromJson(json["support"]) : null;

    return UserResponse(
      page: page,
      perPage: perPage,
      total: total,
      totalPages: totalPages,
      data: data,
      support: support,
      error: error,
    );
  }

  Users toEntity() {
    final _listUser = data!
        .map<User>(
          (model) => User(
              name: "${model.firstName} ${model.lastName}",
              avatar: model.avatar ?? "",
              email: model.email ?? "",
            ),)
        .toList();
    return Users(_listUser, page ?? 1, totalPages ?? 1);
  }

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
        support,
        error,
      ];
}

class SupportUser extends Equatable {
  final String? url;
  final String? text;

  const SupportUser(this.url, this.text);

  SupportUser.fromJson(dynamic json)
      : url = json["url"] as String?,
        text = json["text"] as String?;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["url"] = url;
    map["text"] = text;
    return map;
  }

  @override
  List<Object?> get props => [
        url,
        text,
      ];
}

class DataUser extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const DataUser(
      this.id, this.email, this.firstName, this.lastName, this.avatar);

  DataUser.fromJson(dynamic json)
      : id = json["id"] as int?,
        email = json["email"] as String?,
        firstName = json["first_name"] as String?,
        lastName = json["last_name"] as String?,
        avatar = json["avatar"] as String?;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["email"] = email;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    map["avatar"] = avatar;
    return map;
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}
