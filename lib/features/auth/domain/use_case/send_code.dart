import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:investa/core/base_use_case/base_use_case.dart';
import 'package:investa/core/error/failure.dart';
import 'package:investa/features/auth/domain/repo/base_repo.dart';
import 'package:investa/features/auth/domain/use_case/sign_up_use_case.dart';
class SendCodeUseCase
    extends BaseUseCase<Map<String, dynamic>, SignUpModel> {
  BaseRepository baseRepository;

  SendCodeUseCase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      SignUpModel parameter) async {
    final result = await baseRepository.sendCode(parameter);

    return result;
  }
}