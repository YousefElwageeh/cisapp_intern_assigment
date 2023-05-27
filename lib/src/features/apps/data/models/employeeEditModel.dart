import "dart:convert";

class employeesEditModel {
  employeeEdit users;
  String status;
  employeesEditModel({
    required this.users,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': users.toMap()});
    result.addAll({'status': status});

    return result;
  }

  factory employeesEditModel.fromMap(Map<String, dynamic> map) {
    return employeesEditModel(
      users: employeeEdit.fromMap(map['data']),
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory employeesEditModel.fromJson(String source) =>
      employeesEditModel.fromMap(json.decode(source));
}

class employeeEdit {
  int? id;
  String employee_name;
  int employee_salary;
  int employee_age;
  employeeEdit({
    this.id,
    required this.employee_name,
    required this.employee_salary,
    required this.employee_age,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'employee_name': employee_name});
    result.addAll({'employee_salary': employee_salary});
    result.addAll({'employee_age': employee_age});

    return result;
  }

  factory employeeEdit.fromMap(Map<String, dynamic> map) {
    return employeeEdit(
      id: map['id']?.toInt(),
      employee_name: map['employee_name'] ?? '',
      employee_salary: map['employee_salary']?.toInt() ?? 0,
      employee_age: map['employee_age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory employeeEdit.fromJson(String source) =>
      employeeEdit.fromMap(json.decode(source));
}
