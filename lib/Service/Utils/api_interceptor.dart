import 'package:burgerking_apitest/Service/Utils/api_request_failure.dart';
import 'package:dartz/dartz.dart';


Future<Either<ApiRequestFailure, R>> apiInterceptor<R>(
    Future<R> Function() func) async {
  try {
    final res = await func();
    return Right(res);
  } catch (e) {
    return Left(ApiRequestFailure(e));
  }
}
