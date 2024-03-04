import 'package:dartz/dartz.dart';
import 'package:investa/core/error/failure.dart';
import 'package:investa/core/models/my_data_model.dart';
import 'package:investa/core/utils/api_helper.dart';
import 'package:investa/core/models/vacancey_model.dart';
import 'package:investa/features/profile/data/data%20source/profile_remote_data_source.dart';
import 'package:investa/features/profile/domain/repo/profile_base_repo.dart';

class ProfileRepositoryImp extends BaseRepositoryProfile {
  final BaseRemotelyDataSourceProfile baseRemotelyDataSourceProfile;

  ProfileRepositoryImp({required this.baseRemotelyDataSourceProfile});

  @override
  Future<Either<MyDataModel, Failure>> getMyData() async {
    try {
      final result = await baseRemotelyDataSourceProfile.getMyData();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<List<VacancyModel>, Failure>> getMyApplications(String type) async {
    try {
      final result = await baseRemotelyDataSourceProfile.getMyApplications(type);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
