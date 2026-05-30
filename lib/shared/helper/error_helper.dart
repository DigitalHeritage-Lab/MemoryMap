import 'dart:developer' show log;

// --- Simple Either Implementation ---
abstract class Either<L, R> {
  const Either();

  T fold<T>(T Function(L left) leftFn, T Function(R right) rightFn);

  bool get isLeft => fold((_) => true, (_) => false);
  bool get isRight => fold((_) => false, (_) => true);
}

class Left<L, R> extends Either<L, R> {
  const Left(this.value);
  final L value;

  @override
  T fold<T>(T Function(L left) leftFn, T Function(R right) rightFn) {
    return leftFn(value);
  }
}

class Right<L, R> extends Either<L, R> {
  const Right(this.value);
  final R value;

  @override
  T fold<T>(T Function(L left) leftFn, T Function(R right) rightFn) {
    return rightFn(value);
  }
}

// --- Failure Model ---
class Failure {
  const Failure(this.message, {this.exception, this.stackTrace});
  final String message;
  final dynamic exception;
  final StackTrace? stackTrace;

  @override
  String toString() => message;
}

// --- Helpers ---
Future<Either<Failure, T>> eitherFutureHelper<T>(
  Future<T> Function() action,
) async {
  try {
    final result = await action();
    return Right(result);
  } on Object catch (e, stackTrace) {
    log(
      'Error caught in eitherFutureHelper',
      error: e,
      stackTrace: stackTrace,
      name: 'ErrorHelper',
    );

    String message = e.toString();

    if (message.contains('DUPLICATE_GRAVE_DETECTED') ||
        message.contains('DUPLICATE_GRAVE')) {
      message = 'duplicateGrave';
    }

    return Left(
      Failure(
        message,
        exception: e,
        stackTrace: stackTrace,
      ),
    );
  }
}

Either<Failure, T> eitherHelper<T>(T Function() action) {
  try {
    final result = action();
    return Right(result);
  } on Object catch (e, stackTrace) {
    log(
      'Error caught in eitherHelper',
      error: e,
      stackTrace: stackTrace,
      name: 'ErrorHelper',
    );
    var message = e.toString();

    if (message.contains('DUPLICATE_GRAVE_DETECTED') ||
        message.contains('DUPLICATE_GRAVE')) {
      message = 'duplicateGrave';
    }

    return Left(
      Failure(
        message,
        exception: e,
        stackTrace: stackTrace,
      ),
    );
  }
}
