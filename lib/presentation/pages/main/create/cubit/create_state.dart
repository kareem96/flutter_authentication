part of 'create_cubit.dart';

enum CreateStatus { loading, success, failure }

extension CreateStatusX on CreateStatus {
  bool get isLoading => this == CreateStatus.loading;

  bool get isSuccess => this == CreateStatus.success;

  bool get isFailure => this == CreateStatus.failure;
}

class CreateState extends Equatable {
  final CreateStatus status;
  final Create? create;
  final String? message;

  const CreateState(
      {this.status = CreateStatus.loading, this.create, this.message});

  CreateState copyWith({
    CreateStatus? status,
    Create? create,
    String? message,
  }) {
    return CreateState(
        status: status ?? this.status,
        create: create ?? this.create,
        message: message ?? this.message
    );
  }

  @override
  List<Object?> get props => [status, create, message];
}
