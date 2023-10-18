import 'package:equatable/equatable.dart';

abstract class NetworkResponse<T> extends Equatable {
  const NetworkResponse._();

  const factory NetworkResponse.success(T data) = Success<T>;
  const factory NetworkResponse.fail(Object error) = Fail<T>;
}

class Success<T> extends NetworkResponse<T> {
  final T data;

  const Success(this.data) : super._();

  @override
  List<Object?> get props => [data];
}

class Fail<T> extends NetworkResponse<T> {
  final Object error;

  const Fail(this.error) : super._();

  @override
  List<Object?> get props => [error];
}
