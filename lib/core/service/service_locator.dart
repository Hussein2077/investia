import 'package:get_it/get_it.dart';
import 'package:investa/core/service/navigator_services.dart';
import 'package:investa/features/auth/data/auth_remote_data_source.dart';
import 'package:investa/features/auth/data/repo_imp.dart';
import 'package:investa/features/auth/domain/repo/base_repo.dart';
import 'package:investa/features/auth/domain/use_case/google_sign.dart';
import 'package:investa/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:investa/features/auth/domain/use_case/sign_up_use_case.dart';
import 'package:investa/features/auth/presentation/controller/login_bloc/login_with_email_and_password_bloc.dart';
import 'package:investa/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_bloc.dart';
import 'package:investa/features/auth/presentation/controller/sign_up_bloc/sign_up_with_email_and_password_bloc.dart';
import 'package:investa/features/home/data/data%20source/home_remote_data_source.dart';
import 'package:investa/features/home/data/repo%20imp/repo_imp.dart';
import 'package:investa/features/home/domain/repo/jobs_base_repo.dart';
import 'package:investa/features/home/domain/use_case/get_cities.dart';
import 'package:investa/features/home/domain/use_case/get_major_uc.dart';
import 'package:investa/features/home/domain/use_case/get_university_uc.dart';
import 'package:investa/features/home/presentation/controller/get_cities_major_universtity/get_options_bloc.dart';
import 'package:investa/features/profile/data/data%20source/profile_remote_data_source.dart';
import 'package:investa/features/profile/data/repo%20imp/repo_imp.dart';
import 'package:investa/features/profile/domain/repo/profile_base_repo.dart';
import 'package:investa/features/profile/domain/use_case/my_applications_us.dart';
import 'package:investa/features/profile/presentation/controller/get_my_applications/get_my_applications_bloc.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc

    getIt.registerLazySingleton(() => LoginWithEmailAndPasswordBloc(
        loginWithEmailAndPasswordUseCase: getIt()));
    getIt.registerLazySingleton(
        () => SignInWithPlatformBloc(signInWithGoogleUC: getIt()));
    getIt.registerLazySingleton(() => SignUpWithEmailAndPasswordBloc(
          signUpWithEmailAndPasswordUseCase: getIt(),
        ));
    getIt.registerLazySingleton(
        () => GetMyApplicationsBloc(getMyApplicationsUseCase: getIt()));
    getIt.registerLazySingleton(() => OptionsBloc(
          getCitiesUseCase: getIt(),
          getMajorUseCase: getIt(),
          getUniversityUseCase: getIt(),
        ));

//use_case
    getIt.registerFactory(
        () => LoginWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => SignInWithGoogleUC(baseRepository: getIt()));
    getIt.registerFactory(
        () => GetMyApplicationsUseCase(baseRepositoryProfile: getIt()));
    getIt.registerFactory(
        () => SignUpWithEmailAndPasswordUseCase(baseRepository: getIt()));
    getIt.registerFactory(() => GetCitiesUseCase(baseRepositoryHome: getIt()));
    getIt.registerFactory(() => GetMajorUseCase(baseRepositoryHome: getIt()));
    getIt.registerFactory(
        () => GetUniversityUseCase(baseRepositoryHome: getIt()));
    //remote data
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceHome>(
        () => HomeRemotelyDateSource());
    getIt.registerLazySingleton<BaseRemotelyDataSourceProfile>(
        () => ProfileRemotelyDateSource());
//repo
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<BaseRepositoryHome>(
        () => HomeRepositoryImp(baseRemotelyDataSourceHome: getIt()));
    getIt.registerLazySingleton<BaseRepositoryProfile>(
        () => ProfileRepositoryImp(baseRemotelyDataSourceProfile: getIt()));
    getIt.registerLazySingleton(() => NavigationService());
  }
}
