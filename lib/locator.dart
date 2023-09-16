
import 'package:burgerking_apitest/core/controller/controller.dart';
import 'package:burgerking_apitest/core/repository/chracter_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup(){
  getIt.registerLazySingleton<Characterrepo>(() => Characterrepo());
  getIt.registerLazySingleton<ChracterController>(() => ChracterController());
}