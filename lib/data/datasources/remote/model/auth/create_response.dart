

import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/auth/create.dart';

class CreateResponse extends Equatable{
  final String? id;
  final String? name;
  final String? job;
  final String? error;

  const CreateResponse({
    this.id,
    this.name,
    this.job,
    this.error,
  });

  CreateResponse.fromJson(dynamic json) :
        id = json["id"] as String?,
        name = json["name"] as String?,
        job = json["job"] as String?,
        error = json["error"] as String?;

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["job"] = job;
    map["error"] = error;

    return map;
  }

  Create toEntity() => Create(id);

  @override
  List<Object?> get props => [
    id,
    name,
    job,
    error
  ];
}