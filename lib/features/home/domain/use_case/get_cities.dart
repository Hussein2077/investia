import 'package:dartz/dartz.dart';
import 'package:investa/core/base_use_case/base_use_case.dart';
import 'package:investa/core/error/failure.dart';
import 'package:investa/features/home/data/model/cities_model.dart';
import 'package:investa/features/home/domain/repo/jobs_base_repo.dart';

class GetCitiesUseCase extends BaseUseCase<List<CitiesModel>, NoParameter> {
  final BaseRepositoryHome baseRepositoryHome;

  GetCitiesUseCase({required this.baseRepositoryHome});

  @override
  Future<Either<List<CitiesModel>, Failure>> call(NoParameter parameter) async {
    final result = await baseRepositoryHome.getCities();

    return result;
  }
}
