import 'package:simple_chat_application/core/error_data.dart';

class ActionResponse<T> {
  bool isSuccess = false;
  T? data;
  ErrorData? errorData;

  ActionResponse(this.isSuccess, {this.data, this.errorData});

  factory ActionResponse.success(T data) {
    return ActionResponse(true, data: data);
  }

  factory ActionResponse.error(ErrorData errorData) {
    return ActionResponse(false, errorData: errorData);
  }
}
