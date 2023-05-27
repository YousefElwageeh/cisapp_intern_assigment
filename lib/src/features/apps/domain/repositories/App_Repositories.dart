import 'package:cisapp_intern_assigment/src/features/apps/data/models/employeeEditModel.dart';
import 'package:cisapp_intern_assigment/src/features/apps/data/models/usersModel.dart';
import 'package:dartz/dartz.dart';

abstract class AppRepositories {
  Future<Either<Exception, employeesModel>> getEmployees();
  Future<Either<Exception, employeesEditModel>> editEmployees(employee model);
  Future<Either<Exception, void>> deleteEmployees(int Id);
  Future<Either<Exception, employeesEditModel>> addEmployees(employee model);
}
