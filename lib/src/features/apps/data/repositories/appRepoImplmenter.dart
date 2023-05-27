import 'package:cisapp_intern_assigment/src/features/apps/data/models/employeeEditModel.dart';
import 'package:cisapp_intern_assigment/src/features/apps/data/models/usersModel.dart';
import 'package:cisapp_intern_assigment/src/features/apps/data/repositories/remoteDataSource.dart';
import 'package:cisapp_intern_assigment/src/features/apps/domain/repositories/App_Repositories.dart';
import 'package:dartz/dartz.dart';

class ApprepoImplmenter extends AppRepositories {
  final RemoteDataSourceRepo _remoteDataSourceRepo =
      RemoteDataSourceImplemnter();
  @override
  Future<Either<Exception, void>> deleteEmployees(int Id) async {
    try {
      var result = await _remoteDataSourceRepo.deleteEmployees(Id);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, employeesEditModel>> editEmployees(
      employee model) async {
    try {
      var result = await _remoteDataSourceRepo.editEmployees(model);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, employeesModel>> getEmployees() async {
    try {
      var result = await _remoteDataSourceRepo.getEmployees();

      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, employeesEditModel>> addEmployees(
      employee model) async {
    try {
      var result = await _remoteDataSourceRepo.addEmployees(model);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
