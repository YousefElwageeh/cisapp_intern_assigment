part of 'apps_cubit.dart';

abstract class AppsState extends Equatable {
  const AppsState();

  @override
  List<Object> get props => [];
}

class AppsInitial extends AppsState {}

class GetEmployyesSuccess extends AppsState {}

class GetEmployyesLoading extends AppsState {}

class GetEmployyesError extends AppsState {
  String error;
  GetEmployyesError({
    required this.error,
  });
}

class EditEmployyesSuccess extends AppsState {}

class EditEmployyesLoading extends AppsState {}

class EditEmployyesError extends AppsState {
  String error;
  EditEmployyesError({
    required this.error,
  });
}

class DeleteEmployyesSuccess extends AppsState {}

class DeleteEmployyesLoading extends AppsState {}

class DeleteEmployyesError extends AppsState {
  String error;
  DeleteEmployyesError({
    required this.error,
  });
}

class AddEmployyesSuccess extends AppsState {}

class AddEmployyesLoading extends AppsState {}

class AddEmployyesError extends AppsState {
  String error;
  AddEmployyesError({
    required this.error,
  });
}
