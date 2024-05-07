import '../types/typedef.dart';

abstract class UseCase<T, P> {
  FutureResult<T> call(P params);
}
