abstract class NetworkResponse<T> {
  const NetworkResponse._();

  factory NetworkResponse.success(T data) = Success<T>;
  factory NetworkResponse.fail(Object error) = Fail<T>;
}

class Success<T> extends NetworkResponse<T> {
  final T data;

  Success(this.data) : super._();
}

class Fail<T> extends NetworkResponse<T> {
  final Object error;

  Fail(this.error) : super._();
}
