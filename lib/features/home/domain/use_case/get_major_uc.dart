import 'package:dartz/dartz.dart';
import 'package:investa/core/base_use_case/base_use_case.dart';
import 'package:investa/core/error/failure.dart';
import 'package:investa/features/home/data/model/major_model.dart';
import 'package:investa/features/home/domain/repo/jobs_base_repo.dart';

class GetMajorUseCase extends BaseUseCase<List<MajorModel>, NoParameter> {
  final BaseRepositoryHome baseRepositoryHome;

  GetMajorUseCase({required this.baseRepositoryHome});

  @override
  Future<Either<List<MajorModel>, Failure>> call(NoParameter parameter) async {
    final result = await baseRepositoryHome.getMajor();

    return result;
  }
}
