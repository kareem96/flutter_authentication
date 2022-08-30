import 'package:equatable/equatable.dart';

class Create extends Equatable {
  final String? id;

  const Create(this.id);

  @override
  List<Object?> get props => [id];
}
