import '../api/end_points.dart';

class ExceptionModel {
  final int status;
  final String errorMass;

  ExceptionModel({required this.errorMass, required this.status});
  factory ExceptionModel.fromJson(Map<String, dynamic> jasonDate) {
    return ExceptionModel(
        errorMass: jasonDate[ApiKey.errorMessage],
        status: jasonDate[ApiKey.status]);
  }
}
