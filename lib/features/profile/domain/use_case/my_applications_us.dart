import 'package:dartz/dartz.dart';
import 'package:investa/core/base_use_case/base_use_case.dart';
import 'package:investa/core/error/failure.dart';
import 'package:investa/core/models/vacancey_model.dart';
import 'package:investa/features/profile/domain/repo/profile_base_repo.dart';

class GetMyApplicationsUseCase extends BaseUseCase<List<VacancyModel>,String>{
  final BaseRepositoryProfile baseRepositoryProfile;

  GetMyApplicationsUseCase({required this.baseRepositoryProfile});

  @override
  Future<Either<List<VacancyModel>, Failure>> call(String parameter) async {
    final result = await baseRepositoryProfile.getMyApplications(parameter);

    return result;
  }
}
