import 'package:dartz/dartz.dart';
import 'package:investa/core/error/failure.dart';
import 'package:investa/core/models/my_data_model.dart';
import 'package:investa/core/models/vacancey_model.dart';

abstract class BaseRepositoryProfile {
  Future<Either<MyDataModel, Failure>> getMyData();
  Future<Either<List<VacancyModel>, Failure>> getMyApplications(String type);
}
