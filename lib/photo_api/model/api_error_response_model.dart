class ApiErrorResponseModel {
  ApiError? apiError;

  ApiErrorResponseModel({this.apiError});

  ApiErrorResponseModel.fromJson(Map<String, dynamic> json) {
    apiError = json['apierror'] != null ? ApiError.fromJson(json['apierror']) : null;
  }
}

class ApiError {
  String? status;
  int? timestamp;
  String? message;

  ApiError({
    this.status,
    this.timestamp,
    this.message,
  });

  ApiError.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    timestamp = json['timestamp'];
    message = json['message'];
  }
}
