import "dart:convert";

class employeesModel {
  List<employee> users;
  String status;
  employeesModel({
    required this.users,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'data': users.map((x) => x.toMap()).toList()});
    result.addAll({'status': status});

    return result;
  }

  factory employeesModel.fromMap(Map<String, dynamic> map) {
    return employeesModel(
      users: List<employee>.from(
          map['data']?.map((x) => employee.fromMap(x)) ?? const []),
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory employeesModel.fromJson(String source) =>
      employeesModel.fromMap(json.decode(source));
}

class employee {
  int? id;
  String employee_name;
  int employee_salary;
  int employee_age;
  employee({
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

  factory employee.fromMap(Map<String, dynamic> map) {
    return employee(
      id: map['id']?.toInt(),
      employee_name: map['employee_name'] ?? '',
      employee_salary: map['employee_salary']?.toInt() ?? 0,
      employee_age: map['employee_age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory employee.fromJson(String source) =>
      employee.fromMap(json.decode(source));
}
