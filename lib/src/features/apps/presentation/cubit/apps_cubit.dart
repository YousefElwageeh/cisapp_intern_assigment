import 'package:bloc/bloc.dart';
import 'package:cisapp_intern_assigment/src/features/apps/data/repositories/appRepoImplmenter.dart';
import 'package:cisapp_intern_assigment/src/features/apps/domain/repositories/App_Repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/usersModel.dart';

part 'apps_state.dart';

class AppsCubit extends Cubit<AppsState> {
  AppsCubit() : super(AppsInitial());

  AppRepositories appRepositories = ApprepoImplmenter();
  employeesModel? employees;
// get getEmployees
  void getEmployees() {
    emit(GetEmployyesLoading());
    appRepositories.getEmployees().then((value) => value.fold((error) {
          Get.snackbar(
              animationDuration: const Duration(seconds: 2),
              'Error Message',
              error.toString(),
              backgroundColor: Colors.red,
              colorText: Colors.white);
          emit(GetEmployyesError(error: error.toString()));
        }, (data) {
          employees = data;
          Get.snackbar(
              animationDuration: const Duration(seconds: 2),
              'Success Message',
              'add Employee Successfully',
              backgroundColor: Colors.green,
              colorText: Colors.white);
          emit(GetEmployyesSuccess());
        }));
  }

  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();

  TextEditingController age = TextEditingController();
  void editEmployees(int index) {
    if (formKey.currentState!.validate()) {
      //make an instanent of emplyee object to pass it ro edit function
      employee model = employee(
          id: employees!.users[index].id,
          employee_name: name.text,
          employee_salary: int.parse(salary.text),
          employee_age: int.parse(age.text));
      emit(EditEmployyesLoading());
      appRepositories.editEmployees(model).then((value) => value.fold((error) {
            emit(EditEmployyesError(error: error.toString()));

            Get.snackbar(
                animationDuration: const Duration(seconds: 2),
                'Error Message',
                error.toString(),
                backgroundColor: Colors.red,
                colorText: Colors.white);
          }, (data) {
            //make the edit in real time
            employees!.users[index].employee_age = data.users.employee_age;
            employees!.users[index].employee_name = data.users.employee_name;
            employees!.users[index].employee_salary =
                data.users.employee_salary;

            clearAllControllers();
            Get.snackbar(
                animationDuration: const Duration(seconds: 2),
                'Success Message',
                'Edit Employee Successfully',
                backgroundColor: Colors.green,
                colorText: Colors.white);
            emit(EditEmployyesSuccess());
          }));
    }
  }

  void deleteEmployees(int index) {
    emit(DeleteEmployyesLoading());

    appRepositories
        .deleteEmployees(employees!.users[index].id!)
        .then((value) => value.fold((error) {
              emit(DeleteEmployyesError(error: error.toString()));
              Get.snackbar(
                  animationDuration: const Duration(seconds: 2),
                  'Error Message',
                  error.toString(),
                  backgroundColor: Colors.red,
                  colorText: Colors.white);
            }, (data) {
              //remove the employee in real time

              employees!.users.removeAt(index);
              Get.snackbar(
                  animationDuration: const Duration(seconds: 2),
                  'Success Message',
                  'delete Employee Successfully',
                  backgroundColor: Colors.green,
                  colorText: Colors.white);
              emit(DeleteEmployyesSuccess());
            }));
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void addEmployees() {
    if (formKey.currentState!.validate()) {
      employee model = employee(
          employee_name: name.text,
          employee_salary: int.parse(salary.text),
          employee_age: int.parse(age.text));

      emit(AddEmployyesLoading());

      appRepositories.addEmployees(model).then((value) => value.fold((error) {
            emit(AddEmployyesError(error: error.toString()));
            Get.snackbar(
                animationDuration: const Duration(seconds: 2),
                'Error Message',
                error.toString(),
                backgroundColor: Colors.red,
                colorText: Colors.white);
          }, (data) {
            //add the employee in real time
            employees?.users.add(employee(
              employee_age: data.users.employee_age,
              employee_name: data.users.employee_name,
              employee_salary: data.users.employee_salary,
            ));
            clearAllControllers();
            Get.snackbar(
                animationDuration: const Duration(seconds: 2),
                'Success Message',
                'add Employee Successfully',
                backgroundColor: Colors.green,
                colorText: Colors.white);
            emit(AddEmployyesSuccess());
          }));
    }
  }

  void clearAllControllers() {
    name.clear();
    age.clear();
    salary.clear();
  }

  void showEmployeData(int index) {
    //show the empluee data on textdormfileds bedore editing
    name.text = employees!.users[index].employee_name;
    age.text = employees!.users[index].employee_age.toString();

    salary.text = employees!.users[index].employee_salary.toString();
  }
}
