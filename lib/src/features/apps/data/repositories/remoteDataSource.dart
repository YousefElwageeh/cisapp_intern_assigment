import 'package:cisapp_intern_assigment/src/core/api/Constant&endPoints.dart';
import 'package:cisapp_intern_assigment/src/core/api/dio_factory.dart';
import 'package:cisapp_intern_assigment/src/features/apps/data/models/employeeEditModel.dart';
import 'package:cisapp_intern_assigment/src/features/apps/data/models/usersModel.dart';

abstract class RemoteDataSourceRepo {
  Future<void> deleteEmployees(int Id);
  Future<employeesModel> getEmployees();
  Future<employeesEditModel> editEmployees(employee model);
  Future<employeesEditModel> addEmployees(employee model);
}

class RemoteDataSourceImplemnter extends RemoteDataSourceRepo {
  @override
  Future<void> deleteEmployees(int Id) async {
    await DioFactory.deleteData(url: '${EndPoints.delete}/$Id');
  }

  @override
  Future<employeesEditModel> editEmployees(employee model) async {
    var result = await DioFactory.putdata(
        url: '${EndPoints.update}/${model.id}', data: model.toJson());
    return employeesEditModel.fromMap(result.data);
  }

  @override
  Future<employeesModel> getEmployees() async {
    var result = await DioFactory.getdata(url: EndPoints.employees);

    return employeesModel.fromMap(result.data);
  }

  @override
  Future<employeesEditModel> addEmployees(employee model) async {
    var result =
        await DioFactory.postdata(url: EndPoints.create, data: model.toJson());
    return employeesEditModel.fromMap(result.data);
  }
}
